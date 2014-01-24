using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;
using CMG.Class;

namespace CMG.JS
{
    /// <summary>
    /// ChePiaoUser 的摘要说明
    /// </summary>
    public class ChePiaoUser : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string flag = context.Request["flag"].ToString();
            string strUserID = context.Session["ID"].ToString();
            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);
            if (flag == "add")
            {
                string strCheCiID = context.Request["CheCiID"].ToString();
                string strDingPiaoShu = context.Request["DingPiaoShu"].ToString();
                string strYuPiao = context.Request["YuPiao"].ToString();
               
                string addSQL = "insert dbo.tabDingPiao values (";
                addSQL += "'" + strUserID + "', '" + strCheCiID + "', '" + strDingPiaoShu + "','" + strYuPiao + "', getDate() ) ";
                addSQL += "Update dbo.tabDingPiao set YuPiao ='" + strYuPiao + "' where CheCiID='" + strCheCiID + "'";
                SqlCommand command = new SqlCommand(addSQL, dataConn);
                dataConn.Open();
                command.ExecuteNonQuery();
                dataConn.Close();
                context.Response.Write("OK");
            }
            else if (flag == "delete")
            {
                string strdelID = context.Request["delID"].ToString();
                string strCheCiID = context.Request["CheCiID"].ToString(); 
                string strYuPiao = context.Request["YuPiao"].ToString();
                string[] arrydelID = strdelID.Split('-');
                string delSQL = " ";
                for (int i = 0; i < arrydelID.Count(); i++)
                {
                    delSQL = "delete from dbo.tabDingPiao where ID = '" + arrydelID[i].ToString() + "' ";
                    delSQL += "Update dbo.tabDingPiao set YuPiao ='" + strYuPiao + "' where CheCiID='" + strCheCiID + "'";

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