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
            string notelist = "<div id=\"accordion\">";
            string strSQL = "select ID,Title,Note,CreatDate,Creator from dbo.tabNote ";
            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);

            dataConn.Open();
            SqlDataAdapter da = new SqlDataAdapter(strSQL, strDataConn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
           
            foreach (DataRow row in dt.Rows)
            {
                
                notelist += " <h3 >" + row["Title"].ToString() + "</h3>";
                notelist += "<div><p>" + row["Note"].ToString() + "</p>";
                notelist += "<p>" + row["CreatDate"].ToString() + "</p>";
                notelist += "<p>" + row["Creator"].ToString() + "</p> </div>";
            }
            notelist += "</div>";
            notelist += "<script type=\"text/javascript\"> $(function () { $(\"#accordion\").accordion();});</script>";
            context.Response.ContentType = "text/plain";
            context.Response.Write(notelist);
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