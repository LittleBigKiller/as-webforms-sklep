using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace as_webforms_sklep.services
{
    public class EmailService
    {

        internal static void ProductBought(string email)
        {
            using (MailMessage mm = new MailMessage("mirabelki.sklep@gmail.com", email))
            {
                mm.Subject = "Zamówienie - Sklep Mirabelki";
                mm.Body = "Dziękujemy za zakupy w naszym sklepie, zamówienie zostało przyjęte";
                mm.IsBodyHtml = false;
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