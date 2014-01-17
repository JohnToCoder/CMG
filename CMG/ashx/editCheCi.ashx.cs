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
    /// editCheCi 的摘要说明
    /// </summary>
    public class editCheCi : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string flag = context.Request["flag"].ToString();
            string strID = context.Request["CheID"].ToString();
            string strCheCi = context.Request["CheCi"].ToString();
            string strChufaID = context.Request["ChufaID"].ToString();
            string strMudiID = context.Request["MudiID"].ToString();
            string strCheDate = context.Request["CheDate"].ToString();
            string strCheTime = context.Request["CheTime"].ToString();
            string strPiaoShu = context.Request["PiaoShu"].ToString();
            string strPiaoJia = context.Request["PiaoJia"].ToString();

            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);
            if (flag == "update")
            {
                string updateSQL = "update dbo.tabCheCi set ";
                updateSQL += "CheID ='" + strCheCi + "', ChufaID='" + strChufaID + "', MudiID = '" + strMudiID + "', PiaoShu = '" + strPiaoShu + "', PiaoJia='" + strPiaoJia + "', CheDate='" + strCheDate + "', CheTime = '" + strCheTime + "' where ID = '" + strID + "'";
                SqlCommand command = new SqlCommand(updateSQL, dataConn);
                dataConn.Open();
                command.ExecuteNonQuery();
                dataConn.Close();
                context.Response.Write("OK");
            }
            else if (flag == "add") 
            {
                string addSQL = "insert dbo.tabCheCi values (";
                addSQL += "'" + strCheCi + "', '" + strChufaID + "', '" + strMudiID + "','" + strPiaoShu + "', '" + strPiaoJia + "', '" + strCheDate + "', '" + strCheTime + "' )";
                SqlCommand command = new SqlCommand(addSQL, dataConn);
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