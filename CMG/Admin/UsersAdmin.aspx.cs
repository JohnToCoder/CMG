using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace CMG.Admin
{
    public partial class UsersAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request["SearchKey"] == null)
                {
                    string strSQL = "select a.ID,a.UserID,a.UserName,a.UserPW,a.UserType,b.TypeName,a.UserTel,a.UserEmail from dbo.tabUsers a left join dbo.tabUserType b on a.UserType = b.TypeID";
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
                }
                else
                {
                    string strSearchValue = Request["SearchKey"].ToString().Trim();
                    string[] ArrKeyValue = strSearchValue.Split('=');
                    string strSQL = "select a.ID,a.UserID,a.UserName,a.UserPW,a.UserType,b.TypeName,a.UserTel,a.UserEmail from dbo.tabUsers a left join dbo.tabUserType b on a.UserType = b.TypeID where ";
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