﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="Pages_Alianca_Cadastrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblTitulo" runat="server" Text="Cadastro de Aliança:"></asp:Label>
        <br />
        <asp:ValidationSummary ID="vsMensagem" runat="server" />
        <br />
        <asp:Label ID="lblProduto" runat="server" Text="Produto:"></asp:Label>
        <br />
        <asp:TextBox ID="txtProduto" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvProduto" runat="server" ControlToValidate="txtProduto" ErrorMessage="Digite o nome do produto!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblModelo" runat="server" Text="Modelo:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlModelo" runat="server" DataTextField="MOD_NOME" DataValueField="MOD_ID">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblTamanho" runat="server" Text="Tamanho:"></asp:Label>
        <br />
        <asp:TextBox ID="txtTamanho" runat="server" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvTamanho" runat="server" ControlToValidate="txtTamanho" ErrorMessage="Digite o tamanho do produto!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Voltar"  />
        <asp:Button ID="btnCadastrar" runat="server" OnClick="btnCadastrar_Click" Text="Cadastrar" />
        <br />
        <br />
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
