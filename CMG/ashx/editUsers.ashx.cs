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
    /// editUsers 的摘要说明
    /// </summary>
    public class editUsers : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string flag = context.Request["flag"].ToString();

            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);
            if (flag == "update")
            {
                string strupID = context.Request["ID"].ToString();
                string strupUserID = context.Request["UserID"].ToString();
                string strupUserName = context.Request["UserName"].ToString();
                string strupUserType = context.Request["UserType"].ToString();
                string strupUserTell = context.Request["UserTell"].ToString();
                string strupUserEmail = context.Request["UserEmail"].ToString();
               
                string updateSQL = "update dbo.tabUsers set ";
                updateSQL += "UserID ='" + strupUserID + "', UserName='" + strupUserName + "',UserType = '" + strupUserType + "', UserTel = '" + strupUserTell + "', UserEmail = '" + strupUserEmail + "' where ID = '" + strupID + "'";
                SqlCommand command = new SqlCommand(updateSQL, dataConn);
                dataConn.Open();
                command.ExecuteNonQuery();
                dataConn.Close();
                context.Response.Write("OK");
            }
            else if (flag == "reset") {
                string strupID = context.Request["ID"].ToString();
                string strupMima = context.Request["Mima"].ToString();

                string updateSQL = "update dbo.tabUsers set ";
                updateSQL += "UserPW ='" + strupMima + "' where ID = '" + strupID + "'";
                SqlCommand command = new SqlCommand(updateSQL, dataConn);
                dataConn.Open();
                command.ExecuteNonQuery();
                dataConn.Close();
                context.Response.Write("OK");
            }
            else if (flag == "add")
            {
                string straddUserID = context.Request["UserID"].ToString();
                string straddUserName = context.Request["UserName"].ToString();
                string straddUserType = context.Request["UserType"].ToString();
                string straddUserTell = context.Request["UserTell"].ToString();
                string straddUserEmail = context.Request["UserEmail"].ToString();
                string PassWord = "e10adc3949ba59abbe56e057f20f883e";
                string addSQL = "insert dbo.tabUsers values (";
                addSQL += "'" + straddUserID + "', '" + straddUserName + "', '" + PassWord + "','" + straddUserType + "','" + straddUserTell + "', '" + straddUserEmail + "' )";
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
                    delSQL = "delete from dbo.tabUsers where ID = '" + arrydelID[i].ToString() + "'";
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