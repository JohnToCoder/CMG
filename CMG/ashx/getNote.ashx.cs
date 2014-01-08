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
    /// getNote 的摘要说明
    /// </summary>
    public class getNote : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string json = "{\"total\": ";
            string strSQL = "select ID,Title,Note,CreatDate,Creator from dbo.tabNote ";
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
                json += "\"Title\":\"" + row["Title"].ToString() + "\",";
                json += "\"Note\":\"" + row["Note"].ToString() + "\",";
                json += "\"CreatDate\":\"" + row["CreatDate"].ToString() + "\",";
                json += "\"Creator\":\"" + row["Creator"].ToString() + "\"},";
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