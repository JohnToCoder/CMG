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
                    string strSQL = "select a.ID,b.ID as CheCiID,b.CheID,b.ChufaID,e.staName as ChufaName,b.MudiID,f.staName as MudiName,CONVERT(varchar(12) , b.CheDate, 111 ) as CheDate,CONVERT(varchar(12) ,b.CheTime,108) as CheTime ,b.PiaoShu,a.PiaoShu as DingPiaoShu,a.YuPiao,b.PiaoJia,c.ID as UsersID,c.UserID,c.UserName,d.TypeName,c.UserTel,c.UserEmail from dbo.tabDingPiao a left join dbo.tabCheCi b on a.CheCiID=b.ID left join dbo.tabUsers c on a.UserID=c.ID left join dbo.tabUserType d on d.TypeID=c.UserType left join dbo.tabStation e on e.staID=b.ChufaID left join dbo.tabStation f on f.staID=b.MudiID where a.UserID= '"+sessionID+"'";
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
                    string strSQL = "select a.ID,b.ID as CheCiID,b.CheID,b.ChufaID,e.staName as ChufaName,b.MudiID,f.staName as MudiName,CONVERT(varchar(12) , b.CheDate, 111 ) as CheDate,CONVERT(varchar(12) ,b.CheTime,108) as CheTime ,b.PiaoShu,a.PiaoShu as DingPiaoShu,a.YuPiao,b.PiaoJia,c.ID as UsersID,c.UserID,c.UserName,d.TypeName,c.UserTel,c.UserEmail from dbo.tabDingPiao a left join dbo.tabCheCi b on a.CheCiID=b.ID left join dbo.tabUsers c on a.UserID=c.ID left join dbo.tabUserType d on d.TypeID=c.UserType left join dbo.tabStation e on e.staID=b.ChufaID left join dbo.tabStation f on f.staID=b.MudiID  where ";
                    strSQL += "a.CheCiID like'" + ArrKeyValue[0] + "' or " + "a.UserID like'" + ArrKeyValue[1] + "' or " + "CheDate = '" + ArrKeyValue[2] + "' or CheTime like '" + ArrKeyValue[3] + "%'";
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