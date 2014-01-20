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
    public partial class NoteAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string strSQL = "select a.ID,a.Title,a.Note,a.CreatDate,a.Creator from dbo.tabNote a";
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
}