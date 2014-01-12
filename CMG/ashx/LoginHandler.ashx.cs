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
    /// LoginHandler 的摘要说明
    /// </summary>
    public class LoginHandler : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string strUseName = context.Request["username"].ToString();
            string strPwd = context.Request["pwd"].ToString();
            string strCode = context.Request["code"].ToString();
            Users userInfo = new Users(); //创建用户信息类，保存用户信息
            string strSQL = " select a.ID,a.UserID,a.UserName,a.UserPW,a.UserType,b.TypeName,a.UserTel,a.UserEmail,a.CreatDate,a.Creator from dbo.tabUsers a left join dbo.tabUserType b on a.UserType=b.TypeID " + " where a.UserName = '" + strUseName + "'";
            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);
            SqlCommand command = new SqlCommand(strSQL, dataConn);

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
                dataConn.Open();
                SqlDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    userInfo.sID = dr["ID"].ToString();
                    userInfo.uID = dr["UserID"].ToString();                    
                    userInfo.uName = dr["UserName"].ToString();
                    userInfo.uPW = dr["UserPW"].ToString();
                    userInfo.uUserType = dr["UserType"].ToString();
                    userInfo.uTypeName = dr["TypeName"].ToString();                    
                    userInfo.uEmail = dr["UserEmail"].ToString();
                    userInfo.uTel = dr["UserTel"].ToString();
                    userInfo.uCreatDate = dr["CreatDate"].ToString();
                    userInfo.uCreator = dr["Creator"].ToString();
                }
                dr.Close();
                dataConn.Close();

                if (strUseName == userInfo.uName && strPwd == userInfo.uPW)
                {                    
                   
                    context.Session["ID"]=userInfo.sID;
                    context.Session["UserID"]=userInfo.uID;
                    context.Session["UserName"]=userInfo.uName;
                    context.Session["UserPW"]=userInfo.uPW;
                    context.Session["UserType"]=userInfo.uUserType;
                    context.Session["TypeName"]=userInfo.uTypeName;
                    context.Session["UserEmail"]=userInfo.uEmail;
                    context.Session["UserTel"]=userInfo.uTel;
                    context.Session["CreatDate"]= userInfo.uCreatDate;
                    context.Session["Creator"]=userInfo.uCreator;

                    context.Response.Write("UserSuccess");
                }
                else {
                    context.Response.Write("ErrUser");
                }
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