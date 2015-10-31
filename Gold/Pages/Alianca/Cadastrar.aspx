<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="Pages_Alianca_Cadastrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Cadastro de Alianca"></asp:Label>
        <br />
        <br />
        Produto:<br />
        <asp:TextBox ID="txtProduto" runat="server"></asp:TextBox>
        <br />
        Modelo:<br />
        <asp:DropDownList ID="ddlModelo" runat="server" DataTextField="MOD_NOME" DataValueField="MOD_ID">
        </asp:DropDownList>
        <br />
        Tamanho:<br />
        <asp:TextBox ID="txtTamanho" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnCadastrar" runat="server" OnClick="Button1_Click" Text="Cadastrar" />
        <br />
    
    </div>
    </form>
</body>
</html>
