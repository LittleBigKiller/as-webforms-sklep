<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="as_webforms_sklep.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logowanie</title>
    <link href="~/assets/css/BasketForm/productStyle.css" rel="stylesheet" />
    <link href="~/assets/css/common/headerStyle.css" rel="stylesheet" />
    <link href="~/assets/css/BasketForm/mainStyle.css" rel="stylesheet" />
    <link href="~/assets/css/common/footerStyle.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }

        body {
            background: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div id="title">
                <img src="assets/img/headimglow.jpg" />
            </div>
            <div id="menu">
                <div id="menu-list-box">
                    <ul id="menu-list">
                        <li>
                            <asp:LinkButton ID="lbToMainPage" runat="server" PostBackUrl="~/MainForm.aspx">Strona główna</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="lbToRegister" runat="server" PostBackUrl="~/RegisterForm.aspx" Visible="True">Rejestracja</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="lbToAdmin" runat="server" PostBackUrl="~/AdminPanel.aspx" Visible="False">Panel admina</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="lbToLogin" runat="server" PostBackUrl="~/LoginForm.aspx">Zaloguj się</asp:LinkButton></li>
                    </ul>
                </div>
                <asp:Panel ID="userStatus" runat="server">
                    <asp:LinkButton ID="lbToBasket" CssClass="cart-bt" runat="server" PostBackUrl="~/BasketForm.aspx">Koszyk</asp:LinkButton>
                    <asp:Label ID="lLoggedIn" CssClass="logged-as" runat="server" Visible="True">Nie jesteś zalogowany</asp:Label>
                    <asp:Button ID="bLogout" CssClass="logout-bt" runat="server" OnClick="bLogout_Click" Text="Wyloguj" />
                </asp:Panel>

            </div>
        </header>
        <main>
            <div class="text-container">
                <div>Login:</div>
                <div class="warning-container">
                    <asp:TextBox ID="tbUsername" runat="server" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                </div>
            </div>
            <div class="text-container">
                <div>Hasło:</div>
                <div class="warning-container">
                    <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                </div>
            </div>
            <div id="bt-container">
                <div class="small-container">
                    <asp:Button ID="bLogIn" runat="server" Text="Zaloguj" OnClick="bLogIn_Click" BackColor="#666666" BorderColor="#333333" BorderStyle="Ridge" ForeColor="White" />
                </div>
                <div class="small-container">
                    <asp:Button ID="bGoToRegister" runat="server" Text="Rejestracja" PostBackUrl="~/RegisterForm.aspx" BackColor="#666666" BorderColor="#333333" BorderStyle="Ridge" ForeColor="White" />
                </div>
                <div class="small-container">
                    <asp:Button ID="btToMainForm" runat="server" PostBackUrl="~/MainForm.aspx" Text="Strona główna" BackColor="#666666" BorderColor="#333333" BorderStyle="Ridge" ForeColor="White" />
                </div>
                <div class="small-container">
                    <asp:Label ID="lMsg" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </main>
        <footer>
            <div id="flexfooter">
                <div id="sitemap">
                    <div id="konto">
                        <p>Konto</p>
                        <asp:LinkButton ID="lbToRegister2" runat="server" PostBackUrl="~/RegisterForm.aspx" Visible="False">Rejestracja</asp:LinkButton>
                        <asp:LinkButton ID="lbToAdmin2" runat="server" PostBackUrl="~/AdminPanel.aspx" Visible="False">Panel admina</asp:LinkButton>
                        <asp:LinkButton ID="lbToLogin2" runat="server" PostBackUrl="~/LoginForm.aspx">Zaloguj się</asp:LinkButton>
                        <asp:LinkButton ID="lbToBasket2" runat="server" PostBackUrl="~/BasketForm.aspx">Koszyk</asp:LinkButton>
                    </div>
                    <div id="sklep">
                        <p>Sklep</p>
                        <asp:LinkButton ID="lbToMainPage2" runat="server" PostBackUrl="~/MainForm.aspx">Strona główna</asp:LinkButton>
                        <asp:LinkButton ID="lbToContact" runat="server" PostBackUrl="~/MainForm.aspx">Kontakt</asp:LinkButton>
                    </div>
                </div>
                <div id="info">
                    <p>Kontakt</p>
                    <span>Telefon: +48 123 456 789</span>
                    <span>Mail: mirabelki.sklep@gmail.com</span>
                    <span>Adres: ul. Sklepowa 4/20, 32-137 Koszyce</span>
                </div>
            </div>
            <div id="copyright">© by mirabelki</div>
        </footer>
    </form>
</body>
</html>
