<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="BasketForm.aspx.cs" Inherits="as_webforms_sklep.BasketForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Koszyk</title>
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
                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/MainForm.aspx">Strona główna</asp:LinkButton></li>
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
            <div id="products">
                <asp:Repeater ID="rBasket" runat="server" OnItemCommand="basketHandler">
                    <ItemTemplate>
                        <div class="product">
                            <div class="prod-img-box">
                                <img
                                    class="prod-img"
                                    src="<%# Eval("img_path") %>"
                                    alt="image-placeholder.jpg" />
                            </div>
                            <div class="prod-info">
                                <div class="prod-title">
                                    <%# Eval("name") %>
                                </div>
                                <div class="prod-spec-box">
                                    <div class="prod-spec">
                                        <p class="spec-title">Specyfikacja</p>
                                        <p class="spec-text">Kategoria: <%# as_webforms_sklep.DatabaseHandler.selectQuery("SELECT name FROM product_categories WHERE id LIKE '" + Eval("category").ToString() + "'").Rows[0]["name"] %></p>
                                        <p class="spec-text">Nazwa: <%# Eval("name") %></p>
                                        <p class="spec-text">
                                            Opis: <%# Eval("description") %>
                                        </p>
                                        <p class="spec-text">Dostawca: <%# Eval("supplier") %></p>
                                    </div>
                                    <div class="prod-buy-box">
                                        <div class="prod-price"><u>Cena:</u><%# Eval("price") %></div>
                                        <div class="prod-buy">
                                            <asp:TextBox ID="tbAmount" runat="server" type="number" value='<%# Eval("amount") %>' min="1" step="1"></asp:TextBox>
                                            <asp:Button ID="bChangeProduct" CommandName="changeInBasket" CommandArgument='<%# Eval("id") %>' runat="server" Text="Zmień ilość" />
                                            <asp:Button ID="bRemoveProduct" CommandName="removeFromBasket" CommandArgument='<%# Eval("id") %>' runat="server" Text="Usuń z koszyka" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div>
                <div id="order-box">
                    <asp:Label ID="lTotalPrice" runat="server" Text="Suma:"></asp:Label>
                    <asp:TextBox ID="tbEmail" runat="server" TextMode="Email" BackColor="#666666" BorderColor="#333333" ForeColor="White" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="tbEmail" ErrorMessage="Wpisz poprawny adres email." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:Button ID="bOrder" runat="server" OnClick="bOrder_Click" Text="Złóż zamówienie" />
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
                        <asp:LinkButton ID="lbToMainPage" runat="server" PostBackUrl="~/MainForm.aspx">Strona główna</asp:LinkButton>
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
            <div id="copyright">© by papaj</div>
        </footer>
    </form>
</body>
</html>
