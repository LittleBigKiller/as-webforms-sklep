using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace as_webforms_sklep.services
{
    public class EmailService
    {

        internal static void ProductBought(string email, List<BasketItem> orderList)
        {
            using (MailMessage mm = new MailMessage("mirabelki.sklep@gmail.com", email))
            {
                mm.Subject = "Zamówienie - Sklep Mirabelki";

                float total = 0;
                string body = "Dziękujemy za zakupy w naszym sklepie, zamówienie zostało przyjęte<br/>";
                body += "<table border=1>";
                body += "<tr><th>Nazwa Produktu</th><th>Ilość</th><th>Cena Jednostkowa</th></tr>";

                DataTable dt = new DataTable();
                foreach (BasketItem basketItem in orderList)
                {
                    DataTable tempDt = DatabaseHandler.selectQuery("SELECT * FROM product_info WHERE id = " + basketItem.ProductId);

                    body += "<tr>";
                    body += "<td>" + tempDt.Rows[0]["name"].ToString() + "</td>";
                    body += "<td>" + basketItem.Amount + "</td>";
                    body += "<td>" + tempDt.Rows[0]["price"].ToString() + " zł</td>";

                    total += float.Parse(tempDt.Rows[0]["price"].ToString()) * basketItem.Amount;
                    body += "</tr>";
                }

                body += "<tr><th colspan=2>SUMA</th><th>" + total.ToString("N2") + " zł</th></tr>";
                body += "</table>";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("mirabelki.sklep@gmail.com", "zaq1@WSX");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }
        }
        internal static void UserRegisterConfirmation(string email, string username)
        {
            using (MailMessage mm = new MailMessage("mirabelki.sklep@gmail.com", email))
            {
                var id = DatabaseHandler.selectQuery("SELECT id FROM users WHERE username LIKE '" + username + "'");
                var idTrue = "";
                if (id.Rows.Count == 1)
                    idTrue = id.Rows[0]["id"].ToString();
                Debug.WriteLine(idTrue);
                Debug.WriteLine(username);
                mm.Subject = "Weryfikacja konta Mirabelki";
                string body = "Witaj " + username + ",";
                body += "<br /><br />Proszę kliknij poniższy link, aby zweryfikować swoje konto";
                body += "<br /><a href = 'http://localhost:54291/Verify.aspx/?ActivationCode=" + idTrue + "'> Kliknij tutaj. </a>";
                body += "<br /><br />Dziękujemy i miłych zakupów, <br> Zespół Mirabelki";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("mirabelki.sklep@gmail.com", "zaq1@WSX");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }

        }
    }
}