<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="as_webforms_sklep.RegisterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rejestracja</title>
    <link href="~/assets/css/common/headerStyle.css" rel="stylesheet" />
    <link href="~/assets/css/RegisterPage/mainStyle.css" rel="stylesheet" />
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
    <script type="text/javascript">
        function ValidatePW(source, arguments) {
            arguments.IsValid = arguments.Value.length >= 8
        }
    </script>

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

                </asp:Panel>
            </div>
        </header>
        <main>
            <div id="reg-input">
                <div class="text-container">
                    <div>Login:</div>
                    <div class="warning-container">
                        <asp:TextBox ID="tbUsername" runat="server" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="tbUsername" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="text-container">
                    <div>Hasło:</div>
                    <div class="warning-container">
                        <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <asp:CustomValidator ID="PasswordValidator" runat="server" ControlToValidate="tbPassword" ErrorMessage="Hasło musi mieć co najmniej 8 znaków." ForeColor="Red" ClientValidationFunction="ValidatePW" Display="Dynamic"></asp:CustomValidator>
                </div>

                <div class="text-container">
                    <div>Powtórz hasło:</div>
                    <div class="warning-container">
                        <asp:TextBox ID="tbPasswordRepeat" runat="server" TextMode="Password" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRepeatPassword" runat="server" ControlToValidate="tbPasswordRepeat" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <asp:CompareValidator ID="RepeatPasswordValidator" runat="server" ControlToCompare="tbPassword" ControlToValidate="tbPasswordRepeat" ErrorMessage="Hasła muszą być takie same." ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </div>

                <div class="text-container">
                    <div>Adres e-mail:</div>
                    <div class="warning-container">
                        <asp:TextBox ID="tbEmail" runat="server" TextMode="Email" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="tbEmail" ErrorMessage="Wpisz poprawny adres email." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div class="text-container">
                    <div>Imię:</div>
                    <asp:TextBox ID="tbFirstName" runat="server" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                </div>

                <div class="text-container">
                    <div>Nazwisko:</div>
                    <asp:TextBox ID="tbLastName" runat="server" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                </div>

                <div class="text-container">
                    <div>Adres:</div>
                    <asp:TextBox ID="tbAddress" runat="server" BackColor="#666666" BorderColor="#333333" ForeColor="White"></asp:TextBox>
                </div>
            </div>
            <div id="bBox">
                <div class="small-container">
                    <asp:Button ID="bRegister" runat="server" Text="Zarejestruj się" OnClick="bRegister_Click" BackColor="#666666" BorderColor="#333333" BorderStyle="Ridge" ForeColor="White" />
                </div>
                <div class="small-container">
                    <asp:Button ID="bGotToLogIn" runat="server" Text="Logowanie" PostBackUrl="~/LoginForm.aspx" CausesValidation="False" UseSubmitBehavior="False" BackColor="#666666" BorderColor="#333333" BorderStyle="Ridge" ForeColor="White" />
                </div>
                <div class="small-container">
                    <asp:Button ID="btToMainForm" runat="server" PostBackUrl="~/MainForm.aspx" Text="Strona główna" BackColor="#666666" BorderColor="#333333" BorderStyle="Ridge" ForeColor="White" />
                </div>
                <div class="small-container">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="* Pola wymagane"></asp:Label>
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
