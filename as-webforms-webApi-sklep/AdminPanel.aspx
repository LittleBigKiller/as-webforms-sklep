<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="as_webforms_sklep.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Panel Administracyjny</title>

    <link rel="stylesheet prefetch" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <link rel="stylesheet prefetch" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet prefetch" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,200,300,700" />
    <link rel="stylesheet" href="css/admin_panel.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/tabs.js"></script>
</head>
<body style="background-color: #000000; color: #ffffff">
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="MainForm.aspx">Powrót do Main.</asp:LinkButton>
        <br />
        <asp:Label ID="lTest" runat="server" ForeColor="Red"></asp:Label>
        <div style="display: flex; justify-content: space-evenly; align-items: flex-start; flex-direction: row;">
            <asp:GridView ID="gvUsers" AutoGenerateColumns="false" runat="server" OnRowCommand="gvUsers_RowCommand" DataKeyNames="id" Style="background-color: #ffffff; color: #000000">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="username" HeaderText="Username" />
                    <asp:BoundField DataField="access_level" HeaderText="Access Level" />
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton
                                ID="btDeleteUser"
                                Text='<%# Convert.ToInt32(Eval("id")) == 0 || Convert.ToInt32(Eval("id")) == -1 ? "" : "Delete" %>'
                                runat="server"
                                CommandName="DeleteUser"
                                AllowPaging="True"
                                CommandArgument='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Update">
                        <ItemTemplate>
                            <asp:LinkButton
                                ID="btUpdateUser"
                                runat="server"
                                Text='<%# ProcessAccessLevel(Eval("access_level")) %>'
                                CommandName="UpdateUser"
                                AllowPaging="True"
                                CommandArgument='<%#Eval("id")+","+ Eval("access_level")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView
                ID="gvOrders"
                AutoGenerateColumns="false"
                runat="server"
                OnRowCommand="gvOrders_RowCommand"
                DataKeyNames="id"
                OnRowDataBound="Orders_RowDataBound"
                Style="background-color: #ffffff; color: #000000">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:BoundField DataField="user" HeaderText="User" />
                    <asp:BoundField DataField="datetime" HeaderText="Date" />
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <asp:DropDownList ID="orderStateList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="updateOrderState"></asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HiddenField ID="hiddenID" runat="server" Value='<%# Eval("id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div>
                <asp:GridView
                    ID="gvProducts"
                    runat="server"
                    AutoGenerateColumns="false"
                    OnRowCommand="gvProducts_RowCommand"
                    DataKeyNames="id"
                    OnRowDataBound="Products_RowDataBound"
                    Style="background-color: #ffffff; color: #000000">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HiddenField ID="hiddenID" runat="server" Value='<%# Eval("id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:DropDownList ID="productsCatList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="updateProductCat"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="tbProductName" Text='<%#Eval("name") %>' AutoPostBack="true" OnTextChanged="tbProduct_Update"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:TextBox
                                    runat="server"
                                    ID="tbProductDescription"
                                    Text='<%#Eval("description") %>'
                                    AutoPostBack="true"
                                    OnTextChanged="tbProduct_Update"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:TextBox
                                    runat="server"
                                    ID="tbProductPrice"
                                    Text='<%#Eval("price") %>'
                                    AutoPostBack="true"
                                    OnTextChanged="tbProduct_Update"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supplier">
                            <ItemTemplate>
                                <asp:TextBox
                                    runat="server"
                                    ID="tbProductSupplier"
                                    Text='<%#Eval("supplier") %>'
                                    AutoPostBack="true"
                                    OnTextChanged="tbProduct_Update"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:TextBox
                                    runat="server"
                                    ID="tbProductImg_Path"
                                    Text='<%#Eval("img_path") %>'
                                    AutoPostBack="true"
                                    OnTextChanged="tbProduct_Update"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div class="newProduct">
                    <h2>Dodaj nowy produkt:</h2>
                    <table border="1" style="background-color: #ffffff; color: #000000">
                        <tr>
                            <th>Kategoria</th>
                            <th>Nazwa</th>
                            <th>Opis</th>
                            <th>Cena</th>
                            <th>Dostawca</th>
                            <th>Obrazek</th>
                            <th>-</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList runat="server" ID="addCat" />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="addName" />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="addDesc" />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="addPrice" />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="addSupp" />
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="addImg" />
                            </td>
                            <td>
                                <asp:Button runat="server" Text="+" ID="addBT" OnClick="addBT_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
