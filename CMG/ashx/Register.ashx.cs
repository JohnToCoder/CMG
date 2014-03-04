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
    /// Register 的摘要说明
    /// </summary>
    public class Register : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
           context.Response.ContentType = "text/plain";
          
               //获取用户上传的值
               Random ss = new Random();
               string strRandom = ss.Next(1000, 10000).ToString();
               string strUseName = context.Request["username"].ToString();
               string strPwd = context.Request["pwd"].ToString();
               string strtel = context.Request["tel"].ToString();
               string strEmail = context.Request["email"].ToString();
               string strCode = context.Request["code"].ToString();              
               
               //检查用户输入内容
               if (context.Request.Cookies["checkcode"].Value.ToString() == null)
               {
                   context.Response.Write("overtime");
               }

               else if (strCode.ToLower() != context.Request.Cookies["checkcode"].Value.ToLower().ToString())
               {
                   context.Response.Write("CodeError");
               }

               else
               {
                   string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
                   SqlConnection dataConn = new SqlConnection(strDataConn);
                   string addSQL = "insert dbo.tabUsers values (";
                   addSQL += "'" + strRandom + "', '" + strUseName + "', '" + strPwd + "','1', '" + strtel + "', '" + strEmail + "' )";
                   SqlCommand command = new SqlCommand(addSQL, dataConn);
                   dataConn.Open();
                   command.ExecuteNonQuery();
                   dataConn.Close();
                   context.Response.Write("UserSuccess");
                   
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