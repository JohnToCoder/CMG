using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace CMG.User
{
    public partial class ChePiaoUser : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["SearchKey"] == null)
                {
                    string sessionID = Session["ID"].ToString();
                    string strSQL = "select a.ID,b.ID as CheCiID,b.CheID ,b.ChufaID,e.staName as ChufaName,b.MudiID,f.staName as MudiName,CONVERT(varchar(12) , b.CheDate, 111 ) as CheDate,CONVERT(varchar(12) ,b.CheTime,108) as CheTime ,b.PiaoShu,a.DingPiaoShu ,a.YuPiao,b.PiaoJia from dbo.tabDingPiao a left join dbo.tabCheCi b on a.CheCiID=b.ID  left join dbo.tabStation e on e.staID=b.ChufaID left join dbo.tabStation f on f.staID=b.MudiID where a.UserID= '" + sessionID + "'";
                    string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
                    SqlConnection dataConn = new SqlConnection(strDataConn);

                    dataConn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(strSQL, strDataConn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    DataTable dt = ds.Tables[0];
                    ViewState["dt"] = dt;
                    gdvCurrent.DataSource = ds.Tables[0];
                    gdvCurrent.DataBind();
                    dataConn.Close();

                    divtuipiao.Visible = true;
                    divdingpiao.Visible = false;
                }
                else
                {
                    string strSearchValue = Request["SearchKey"].ToString().Trim();
                    string[] ArrKeyValue = strSearchValue.Split('=');
                    string strSQL = "select a.ID,a.ID as CheCiID,d.UserID,d.DingPiaoShu,a.CheID,a.ChufaID,b.staName as ChufaName, a.MudiID,c.staName as MudiName,a.PiaoShu,d.YuPiao,CONVERT(varchar(12) , a.CheDate, 111 ) as CheDate,CONVERT(varchar(12) ,a.CheTime,108) as CheTime ,a.PiaoJia from dbo.tabCheCi a left join dbo.tabStation b on a.ChufaID=b.staID left join dbo.tabStation c on a.MudiID= c.staID left join dbo.tabDingPiao d on d.CheCiID=a.ID where ";
                    strSQL += "ChufaID ='" + ArrKeyValue[0] + "' and " + "MudiID='" + ArrKeyValue[1] + "' or  " + "CheDate = '" + ArrKeyValue[2] + "' or CheTime like '" + ArrKeyValue[3] + "%'";
                    string strDataConn = ConfigurationManager.ConnectionStrings["SQLDataConnStr"].ConnectionString;
                    SqlConnection dataConn = new SqlConnection(strDataConn);

                    dataConn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(strSQL, strDataConn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    DataTable dt = ds.Tables[0];
                    ViewState["dt"] = dt;
                    gdvCurrent.DataSource = ds.Tables[0];
                    gdvCurrent.DataBind();
                    dataConn.Close();

                    divtuipiao.Visible = false;
                    divdingpiao.Visible = true;
                }

               
            }
        }

     
        /// <summary> 
        /// 函數名：gdvCurrent_PageIndexChanging
        /// 函數功能：翻頁
        /// </summary>
        protected void gdvCurrent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            gdvCurrent.PageIndex = e.NewPageIndex;
            gdvCurrent.DataSource = (DataTable)ViewState["dt"];
            gdvCurrent.DataBind();
            txtPageIndex.Text = e.NewPageIndex.ToString();
        }

    }
}