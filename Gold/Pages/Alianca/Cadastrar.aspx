<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="Pages_Alianca_Cadastrar" %>

<%@ Register src="../../Content/Cabecalho.ascx" tagname="Cabecalho" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>  
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Cabecalho ID="Cabecalho1" runat="server" />
        <br />
        <br />
    
        <asp:Label ID="lblTitulo" runat="server" Text="Cadastro de Aliança:"></asp:Label>
        <br />
        <asp:ValidationSummary ID="vsMensagem" runat="server" />
        <br />
        <asp:Label ID="lblModelo" runat="server" Text="Modelo:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlModelo" runat="server" DataTextField="MOD_NOME" DataValueField="MOD_ID">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblTamanho" runat="server" Text="Tamanho:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlTamanho" runat="server" DataTextField="MOD_NOME" DataValueField="MOD_ID">
        </asp:DropDownList>
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
