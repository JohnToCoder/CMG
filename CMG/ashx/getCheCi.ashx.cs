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
            string strSQL = "";
            if (context.Request["init"].ToString() == "0")
            {
                strSQL = "select a.CheID,a.ChufaID,b.staName as ChufaName, a.MudiID,c.staName as MudiName,a.PiaoShu,a.CheDate,a.CheTime from dbo.tabCheCi a left join dbo.tabStation b on a.ChufaID=b.staID left join dbo.tabStation c on a.MudiID= c.staID ";
            }
            else if (context.Request["init"].ToString() == "1")
            {
                string strchufa = context.Request["chufa"].ToString();
                string strmudi = context.Request["mudi"].ToString();
                string strdate = context.Request["date"].ToString();
                string strtime = context.Request["time"].ToString();
                strSQL = "select a.CheID,a.ChufaID,b.staName as ChufaName, a.MudiID,c.staName as MudiName,a.PiaoShu,a.CheDate,a.CheTime from dbo.tabCheCi a left join dbo.tabStation b on a.ChufaID=b.staID left join dbo.tabStation c on a.MudiID= c.staID where ";
                strSQL += "ChufaID ='"+strchufa+"' and " +"MudiID='"+strmudi+"' and " +"CheDate = '"+strdate+"' and CheTime like '"+strtime+"%'";
            }   
            string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
            SqlConnection dataConn = new SqlConnection(strDataConn);

            dataConn.Open();
            SqlDataAdapter da = new SqlDataAdapter(strSQL, strDataConn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            string tabList = "<table id=\"tablist\" style=\" width:100%;height:100%; \"><tr><table ><tr><th align=center style=\" width:40px;\">车次</th><th align=center style=\" width:100px;\">出发地</th><th align=center style=\" width:100px;\">目的地</th><th align=center style=\" width:100px;\">余票</th><th align=center style=\" width:100px;\">发车日期</th><th align=center style=\" width:100px;\">发车时间</th></tr>";

            foreach (DataRow row in dt.Rows)
            {
                tabList += "<tr><td align=center style=\" width:40px;\">" + row["CheID"].ToString() + "</td>";
                tabList += "<td align=center style=\" width:100px;\">" + row["ChufaName"].ToString() + "</td>";
                tabList += "<td align=center style=\" width:100px;\">" + row["MudiName"].ToString() + "</td>";
                tabList += "<td align=center style=\" width:100px;\">" + row["PiaoShu"].ToString() + "</td>";
                tabList += "<td align=center style=\" width:100px;\">" + row["CheDate"].ToString().Substring(0,10)+ "</td>";
                tabList += "<td align=center style=\" width:100px;\">" + row["CheTime"].ToString() + "</td></tr>";
            }
            tabList += "</table>";
            context.Response.ContentType = "text/plain";
            context.Response.Write(tabList);
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