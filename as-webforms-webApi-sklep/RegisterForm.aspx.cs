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
    public partial class RegisterForm : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usertoken"] == null)
            {
                //Response.Redirect("LoginForm.aspx");
                lLoggedIn.Text = "Nie jesteś zalogowany";
                lbToAdmin.Visible = false;
                lbToLogin.Visible = true;

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

        protected void bRegister_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var query = DatabaseHelper.selectQuery("SELECT username FROM users WHERE username LIKE '" + tbUsername.Text + "'");
                if (query.Rows.Count == 1)
                {
                    lMsg.Text = "Nazwa użytkownika zajęta.";
                }
                else
                {
                    if (UserHelper.tryToRegister(tbUsername.Text, tbPassword.Text, tbEmail.Text, new string[3] { tbFirstName.Text, tbLastName.Text, tbAddress.Text }))
                    {
                        EmailHelper.UserRegisterConfirmation(tbEmail.Text, tbUsername.Text);
                        lMsg.Text = "Pomyślnie zarejestrowano.";
                    }
                    else
                    {
                        lMsg.Text = "Błąd podczas rejestracji.";
                    }
                }
            }
        }
    }
}