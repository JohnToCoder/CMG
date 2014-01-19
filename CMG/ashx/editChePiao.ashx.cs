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
    /// editChePiao 的摘要说明
    /// </summary>
    public class editChePiao : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string flag = context.Request["flag"].ToString();           

            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);
           if (flag == "delete")
            {
                string strdelID = context.Request["delID"].ToString();
                string[] arrydelID = strdelID.Split('-');
                string delSQL = " ";
                for (int i = 0; i < arrydelID.Count(); i++)
                {
                    delSQL = "delete from dbo.tabDingPiao where ID = '" + arrydelID[i].ToString() + "'";
                    SqlCommand command = new SqlCommand(delSQL, dataConn);
                    dataConn.Open();
                    command.ExecuteNonQuery();
                    dataConn.Close();
                    delSQL = " ";
                }
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