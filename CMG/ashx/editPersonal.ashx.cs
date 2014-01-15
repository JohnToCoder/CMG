using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;
using CMG.Class;

namespace CMG.ashx
{
    /// <summary>
    /// editPersonal 的摘要说明
    /// </summary>
    public class editPersonal : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string flag = context.Request["flag"].ToString();
            string struid = context.Session["ID"].ToString();
            string strSQL = "update dbo.tabUsers set ";
            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);
            
            if (flag == "1")
            {
                string strusername = context.Request["username"].ToString();
                string strutell = context.Request["utell"].ToString();
                string struemail = context.Request["uemail"].ToString();
                strSQL += "UserName = '" + strusername + "',"+" UserTel = '"+strutell+"',"+"UserEmail = '"+struemail+"' where ID = '"+struid+"'";
                SqlCommand command = new SqlCommand(strSQL, dataConn);
                dataConn.Open();
                command.ExecuteNonQuery();
                dataConn.Close();
                context.Response.Write("OK");
            }
            else if (flag == "2")
            {
                string strpw = context.Request["upassword"].ToString();
                strSQL +=  "UserPW = '" + strpw + "' where UserID = '" + struid + "'";
                SqlCommand command = new SqlCommand(strSQL, dataConn);
                dataConn.Open();
                command.ExecuteNonQuery();
                dataConn.Close();
                context.Response.Write("OK");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}