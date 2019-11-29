using as_webforms_sklep.services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace as_webforms_sklep
{
    public partial class LoginForm : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usertoken"] == null)
            {
                //Response.Redirect("LoginForm.aspx");
                lLoggedIn.Text = "Nie jesteś zalogowany";
                lbToAdmin.Visible = false;
                lbToLogin.Visible = true;
                bLogout.Visible = false;
                lbToRegister.Visible = true;
                lbToLogin2.Visible = true;
            }
            else
            {
                Response.Redirect("MainForm.aspx");
            }

            if (Session["basket"] == null)
            {
                Debug.WriteLine("Create new basket");
                Session["basket"] = new List<ShopItem>();
            }

            calculateBasketItemCount();
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            if (Session["usertoken"] != null)
            {
                UserHelper.tryToLogOut(Session["usertoken"].ToString());
                Session["usertoken"] = null;
                Response.Redirect("MainForm.aspx");
            }
        }

        protected void calculateBasketItemCount()
        {
            List<ShopItem> basketList;
            if (Session["basket"] == null)
            {
                basketList = new List<ShopItem>();
            }
            else
            {
                basketList = (List<ShopItem>)Session["basket"];
            }

            int totalAmount = 0;
            foreach (ShopItem basketItem in basketList)
            {
                totalAmount += basketItem.Amount;
            }

            lbToBasket.Text = "Koszyk (" + totalAmount.ToString() + ")";
        }

        protected void bLogIn_Click(object sender, EventArgs e)
        {
            string token = UserHelper.tryToLogIn(tbUsername.Text, tbPassword.Text);
            if (token == "fail")
            {
                lMsg.Text = "Nieprawidłowy login lub hasło.";
            }
            else
            {
                Session["usertoken"] = token;
                Response.Redirect("MainForm.aspx");
            }
        }
    }
}