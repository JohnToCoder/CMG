using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.SessionState;

namespace CMG.ashx
{
    /// <summary>
    /// getCheCi 的摘要说明
    /// </summary>
    public class getCheCi : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string json = "{\"total\": ";            
            string strSQL = "select a.ID,a.CheID,a.ChufaID,b.staName as ChufaName,a.MudiID,b.staName as MudiName,a.PiaoShu,a.Time  from dbo.tabCheCi a left join dbo.tabStation b on a.ChufaID=b.staID left join dbo.tabStation c on a.MudiID= c.staID";
            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);

            dataConn.Open();
            SqlDataAdapter da = new SqlDataAdapter(strSQL, strDataConn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            json += "20" + ",\"rows\":[";
            foreach (DataRow row in dt.Rows)
            {
                json += "{\"ID\":\"" + row["ID"].ToString() + "\",";
                json += "\"CheID\":\"" + row["CheID"].ToString() + "\",";
                json += "\"ChufaID\":\"" + row["ChufaID"].ToString() + "\",";
                json += "\"ChufaName\":\"" + row["ChufaName"].ToString() + "\",";
                json += "\"MudiID\":\"" + row["MudiID"].ToString() + "\",";
                json += "\"MudiName\":\"" + row["MudiName"].ToString() + "\",";
                json += "\"PiaoShu\":\"" + row["PiaoShu"].ToString() + "\",";
                json += "\"Time\":\"" + row["Time"].ToString().Split('.')[0].ToString() + "\"},";
            }
            json = json.Remove(json.LastIndexOf(','), 1);
            json += "]}";
            context.Response.ContentType = "application/json";
            context.Response.Write(json);
            context.Response.End();      
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