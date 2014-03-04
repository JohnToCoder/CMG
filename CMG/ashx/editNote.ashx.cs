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
    /// editNote 的摘要说明
    /// 编辑通知信息
    /// </summary>
    public class editNote : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string flag = context.Request["flag"].ToString();

            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);
            if (flag == "update")
            {
                string strID = context.Request["ID"].ToString();
                string strTitle = context.Request["Title"].ToString();
                string strNote = context.Request["Note"].ToString();
                string strDate = context.Request["Date"].ToString();
               
                string updateSQL = "update dbo.tabNote set ";
                updateSQL += "Title ='" + strTitle + "',Note='" + strNote + "', CreatDate = '" + strDate + "' where ID = '" + strID + "'";
                SqlCommand command = new SqlCommand(updateSQL, dataConn);
                dataConn.Open();
                command.ExecuteNonQuery();
                dataConn.Close();
                context.Response.Write("OK");
            }
            else if (flag == "add")
            {
                string strTitle = context.Request["Title"].ToString();
                string strNote = context.Request["Note"].ToString();
                string strDate = context.Request["Date"].ToString();
                string addSQL = "insert dbo.tabNote values (";
                addSQL += "'" + strTitle + "', '" + strNote + "', '" + strDate + "','Admin' )";
                SqlCommand command = new SqlCommand(addSQL, dataConn);
                dataConn.Open();
                command.ExecuteNonQuery();
                dataConn.Close();
                context.Response.Write("OK");
            }
            else if (flag == "delete")
            {
                string strdelID = context.Request["delID"].ToString();
                string[] arrydelID = strdelID.Split('-');
                string delSQL = " ";
                for (int i = 0; i < arrydelID.Count(); i++)
                {
                    delSQL = "delete from dbo.tabNote where ID = '" + arrydelID[i].ToString() + "'";
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