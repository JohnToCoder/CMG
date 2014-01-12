using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMG
{
    public partial class MenuTab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            string strUserType = "";
            if (!Page.IsPostBack)
            {               
              //  strUserType = Session["UserType"].ToString();
                if (strUserType == "0")
                {
                    AdminMenu.Visible = true;                   
                    UserMenu.Visible = false;
                }
                else if (strUserType == "1")
                {
                    AdminMenu.Visible = false;                   
                    UserMenu.Visible = true;
                }
            }  
        }
    }
}