﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMG
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                txtuid.Value = Session["UserID"].ToString();
                txtuname.Value = Session["UserName"].ToString();
                txtPassWord.Value = Session["UserPW"].ToString();
                txtUserType.Value = Session["TypeName"].ToString();
                txtTell.Value = Session["UserTel"].ToString();
                txtEmail.Value = Session["UserEmail"].ToString();
            }

        }
    }
}