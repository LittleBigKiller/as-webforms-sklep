using as_webforms_sklep.services;
using System;
using System.Web.UI;

namespace as_webforms_sklep
{
    public partial class RegisterForm : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bRegister_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                var query = DatabaseHelper.selectQuery("SELECT username FROM users WHERE username LIKE '" + tbUsername.Text + "'");
                if(query.Rows.Count == 1)
                {
                    lMsg.Text = "Nazwa użytkownika zajęta.";
                } else
                {
                    if (UserHelper.tryToRegister(tbUsername.Text, tbPassword.Text, tbEmail.Text, new string[3] { tbFirstName.Text, tbLastName.Text, tbAddress.Text}))
                    {
                        EmailHelper.UserRegisterConfirmation(tbEmail.Text, tbUsername.Text);
                        lMsg.Text = "Pomyślnie zarejestrowano.";
                    } else
                    {
                        lMsg.Text = "Błąd podczas rejestracji.";
                    }
                }
            }
        }
    }
}