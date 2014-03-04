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
    /// 登录控制，验证用户信息，添加Session值
    /// </summary>
    public class LoginHandler : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (!string.IsNullOrEmpty(context.Request["rdItem"].ToString()))
            {
                //获取用户上传的值
                string strUseName = context.Request["username"].ToString();
                string strPwd = context.Request["pwd"].ToString();
                string strCode = context.Request["code"].ToString();
                Users userInfo = new Users(); //创建用户信息类，保存用户信息
                //连接数据库查询
                string strSQL = " select a.ID,a.UserID,a.UserName,a.UserPW,a.UserType,b.TypeName,a.UserTel,a.UserEmail from dbo.tabUsers a left join dbo.tabUserType b on a.UserType=b.TypeID " + " where a.UserName = '" + strUseName + "'";
                string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
                SqlConnection dataConn = new SqlConnection(strDataConn);
                SqlCommand command = new SqlCommand(strSQL, dataConn);
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
                    //获取数据库中用户信息
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
                        
                    }
                    dr.Close();
                    dataConn.Close();
                    //验证用户信息并存储session值
                    if (strUseName == userInfo.uName && strPwd == userInfo.uPW)
                    {

                        context.Session["ID"] = userInfo.sID;
                        context.Session["UserID"] = userInfo.uID;
                        context.Session["UserName"] = userInfo.uName;
                        context.Session["UserPW"] = userInfo.uPW;
                        context.Session["UserType"] = userInfo.uUserType;
                        context.Session["TypeName"] = userInfo.uTypeName;
                        context.Session["UserEmail"] = userInfo.uEmail;
                        context.Session["UserTel"] = userInfo.uTel;

                        context.Response.Write("UserSuccess");
                    }
                    else
                    {
                        context.Response.Write("ErrUser");
                    }
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