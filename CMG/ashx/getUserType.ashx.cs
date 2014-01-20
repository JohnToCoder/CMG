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
    /// getUserType 的摘要说明
    /// </summary>
    public class getUserType : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string json = "[";
            string strSQL = "select TypeID,TypeName from dbo.tabUserType ";
            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);

            dataConn.Open();
            SqlDataAdapter da = new SqlDataAdapter(strSQL, strDataConn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];

            foreach (DataRow row in dt.Rows)
            {
                json += "{\"TypeID\":\"" + row["TypeID"].ToString() + "\",";
                json += "\"TypeName\":\"" + row["TypeName"].ToString() + "\"},";
            }
            json = json.Remove(json.LastIndexOf(','), 1);
            json += "]";
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