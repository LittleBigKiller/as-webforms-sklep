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
    public partial class BasketForm : System.Web.UI.Page
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
            else if (UserHandler.getAccessLevel(Session["usertoken"].ToString()) == AccessLevel.ADMIN || UserHandler.getAccessLevel(Session["usertoken"].ToString()) == AccessLevel.ROOT)
            {
                lLoggedIn.Text = "Zalogowano jako <b>" + UserHandler.getUsername(Session["usertoken"].ToString()) + "</b>";
                lbToAdmin.Visible = true;
                lbToLogin.Visible = false;
                bLogout.Visible = true;
                lbToRegister.Visible = false;
                lbToLogin2.Visible = false;
            }
            else
            {
                lLoggedIn.Text = "Zalogowano jako <b>" + UserHandler.getUsername(Session["usertoken"].ToString()) + "</b>";
                lbToAdmin.Visible = false;
                lbToLogin.Visible = false;
                bLogout.Visible = true;
                lbToRegister.Visible = false;
                lbToLogin2.Visible = false;
            }

            if (Session["basket"] == null)
            {
                Debug.WriteLine("Create new basket");
                Session["basket"] = new List<BasketItem>();
            }

            if (!IsPostBack)
            {
                rBasket.DataSource = createProductList();
                rBasket.DataBind();
            }

            calculateTotalPrice();
            calculateBasketItemCount();
        }

        protected void bLogout_Click(object sender, EventArgs e)
        {
            if (Session["usertoken"] != null)
            {
                UserHandler.tryToLogOut(Session["usertoken"].ToString());
                Session["usertoken"] = null;
                Response.Redirect("MainForm.aspx");
            }
        }

        protected void calculateBasketItemCount()
        {
            List<BasketItem> basketList;
            if (Session["basket"] == null)
            {
                basketList = new List<BasketItem>();
            }
            else
            {
                basketList = (List<BasketItem>)Session["basket"];
            }

            int totalAmount = 0;
            foreach (BasketItem basketItem in basketList)
            {
                totalAmount += basketItem.Amount;
            }

            lbToBasket.Text = "Koszyk (" + totalAmount.ToString() + ")";
        }

        protected DataTable createProductList()
        {
            List<BasketItem> basketList;
            if (Session["basket"] == null)
            {
                basketList = new List<BasketItem>();
            }
            else
            {
                basketList = (List<BasketItem>)Session["basket"];
            }

            DataTable dt = new DataTable();
            foreach (BasketItem basketItem in basketList)
            {
                DataTable tempDt = DatabaseHandler.selectQuery("SELECT * FROM product_info WHERE id = " + basketItem.ProductId);
                tempDt.Columns.Add("amount", typeof(int));
                tempDt.Rows[0]["amount"] = basketItem.Amount;

                dt.Merge(tempDt);
            }

            return dt;
        }

        protected void calculateTotalPrice()
        {
            List<BasketItem> basketList;
            if (Session["basket"] == null)
            {
                basketList = new List<BasketItem>();
            }
            else
            {
                basketList = (List<BasketItem>)Session["basket"];
            }

            double totalPrice = 0;
            foreach (BasketItem basketItem in basketList)
            {
                totalPrice += basketItem.Amount * basketItem.Price;
            }

            lTotalPrice.Text = "Suma: " + totalPrice.ToString("N2") + " zł";

            calculateBasketItemCount();
        }

        protected void basketHandler(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "changeInBasket")
            {
                Debug.WriteLine("changeInBasket");
                List<BasketItem> basketList;
                if (Session["basket"] == null)
                {
                    basketList = new List<BasketItem>();
                }
                else
                {
                    basketList = (List<BasketItem>)Session["basket"];
                }

                BasketItem basketItem = basketList.Find(item => item.ProductId == (e.CommandArgument.ToString()));

                int amountToSet = 0;
                TextBox tbAmount = (TextBox)e.Item.FindControl("tbAmount");
                try
                {
                    amountToSet = int.Parse(tbAmount.Text);
                }
                catch (FormatException)
                {
                    amountToSet = basketItem.Amount;
                }

                basketItem.Amount = amountToSet;

                calculateTotalPrice();
                calculateBasketItemCount();
            }
            else if (e.CommandName == "removeFromBasket")
            {
                Debug.WriteLine("removeFromBasket");
                List<BasketItem> basketList;
                if (Session["basket"] == null)
                {
                    basketList = new List<BasketItem>();
                }
                else
                {
                    basketList = (List<BasketItem>)Session["basket"];
                }

                BasketItem basketItem = basketList.Find(item => item.ProductId == (e.CommandArgument.ToString()));

                basketList.Remove(basketItem);
                rBasket.DataSource = createProductList();
                rBasket.DataBind();

                calculateTotalPrice();
                calculateBasketItemCount();
            }
        }

        protected void bOrder_Click(object sender, EventArgs e)
        {
            if (!IsValid) return;

            if (DatabaseHandler.createOrder(Session["usertoken"] == null ? "" : (string)Session["usertoken"], (List<BasketItem>)Session["basket"]))
            {
                EmailService.ProductBought(tbEmail.Text);
                Session["basket"] = null;
                Response.Redirect("ReceiptPage.aspx");
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Nie udało się złożyć zamówienia!')");
        }
    }
}