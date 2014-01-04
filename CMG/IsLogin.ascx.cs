using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMG
{
    public partial class IsLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strUrl = GetRootUrl(HttpContext.Current) + "/login.html";
            string strScript = @"if(parent.parent.parent.parent.parent.parent&&parent.parent.parent.parent.parent.parent.location!=self.location)
                             {
                                parent.parent.parent.parent.parent.parent.window.location='" + strUrl + @"'
                             }

                             else if(parent.parent.parent.parent.parent&&parent.parent.parent.parent.parent.location!=self.location)
                             {
                                parent.parent.parent.parent.parent.window.location='" + strUrl + @"'
                             }

                             else if(parent.parent.parent.parent&&parent.parent.parent.parent.location!=self.location)
                             {
                               parent.parent.parent.parent.window.location='" + strUrl + @"'
                             }

                             else if(parent.parent.parent&&parent.parent.parent.location!=self.location)
                             {
                                parent.parent.parent.window.location='" + strUrl + @"'
                             }

                             else if(parent.parent&&parent.parent.location!=self.location)
                             {
                                parent.parent.window.location='" + strUrl + @"'
                             }

                             else if(parent&&parent.location!=self.location)
                             {
                                parent.window.location='" + strUrl + @"'
                             }
                             else
                             {
                                window.location='" + strUrl + @"'
                             };

                             ";

            if (Session["User"] == null)
            {
                Page page = (Page)HttpContext.Current.Handler;
                page.ClientScript.RegisterStartupScript(page.GetType(), "BackLogin", strScript, true);
                return;
            }
        }

        /// <summary>
        /// 編號:
        /// 函數名：GetRootUrl 
        /// 函數功能：獲取網站根目錄Url              
        private string GetRootUrl(HttpContext context)
        {
            string strRootPath = "";
            if (context != null)
            {
                string UrlAuthority = context.Request.Url.GetLeftPart(UriPartial.Authority);
                if (context.Request.ApplicationPath == null || context.Request.ApplicationPath == "/")
                {
                    strRootPath = UrlAuthority;
                }
                else
                {
                    strRootPath = UrlAuthority + context.Request.ApplicationPath;
                }
            }
            return strRootPath;
        }
    }
}