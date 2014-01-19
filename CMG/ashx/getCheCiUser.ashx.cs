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
    /// getCheCiUser 的摘要说明
    /// </summary>
    public class getCheCiUser : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string type = context.Request["Type"].ToString();
            if (type == "CheCi")
            {
                string json = "[";
                string strSQL = "select ID,CheID from dbo.tabCheCi ";
                string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
                SqlConnection dataConn = new SqlConnection(strDataConn);

                dataConn.Open();
                SqlDataAdapter da = new SqlDataAdapter(strSQL, strDataConn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataTable dt = ds.Tables[0];

                foreach (DataRow row in dt.Rows)
                {
                    json += "{\"ID\":\"" + row["ID"].ToString() + "\",";
                    json += "\"CheID\":\"" + row["CheID"].ToString() + "\"},";
                }
                json = json.Remove(json.LastIndexOf(','), 1);
                json += "]";
                context.Response.ContentType = "application/json";
                context.Response.Write(json);
                context.Response.End();
            }
            else if (type == "User") {
                string json = "[";
                string strSQL = "select ID ,UserName from dbo.tabUsers ";
                string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
                SqlConnection dataConn = new SqlConnection(strDataConn);

                dataConn.Open();
                SqlDataAdapter da = new SqlDataAdapter(strSQL, strDataConn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataTable dt = ds.Tables[0];

                foreach (DataRow row in dt.Rows)
                {
                    json += "{\"ID\":\"" + row["ID"].ToString() + "\",";
                    json += "\"UserName\":\"" + row["UserName"].ToString() + "\"},";
                }
                json = json.Remove(json.LastIndexOf(','), 1);
                json += "]";
                context.Response.ContentType = "application/json";
                context.Response.Write(json);
                context.Response.End();
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