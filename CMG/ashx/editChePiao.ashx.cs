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
            if (flag == "update")
            {
                string strID = context.Request["CheID"].ToString();
                string strCheCi = context.Request["CheCi"].ToString();
                string strChufaID = context.Request["ChufaID"].ToString();
                string strMudiID = context.Request["MudiID"].ToString();
                string strCheDate = context.Request["CheDate"].ToString();
                string strCheTime = context.Request["CheTime"].ToString();
                string strPiaoShu = context.Request["PiaoShu"].ToString();
                string strPiaoJia = context.Request["PiaoJia"].ToString();
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
                string strID = context.Request["CheID"].ToString();
                string strCheCi = context.Request["CheCi"].ToString();
                string strChufaID = context.Request["ChufaID"].ToString();
                string strMudiID = context.Request["MudiID"].ToString();
                string strCheDate = context.Request["CheDate"].ToString();
                string strCheTime = context.Request["CheTime"].ToString();
                string strPiaoShu = context.Request["PiaoShu"].ToString();
                string strPiaoJia = context.Request["PiaoJia"].ToString();
                string addSQL = "insert dbo.tabCheCi values (";
                addSQL += "'" + strCheCi + "', '" + strChufaID + "', '" + strMudiID + "','" + strCheDate + "', '" + strCheTime + "', '" + strPiaoShu + "', '" + strPiaoJia + "' )";
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
                    delSQL = "delete from dbo.tabCheCi where ID = '" + arrydelID[i].ToString() + "'";
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