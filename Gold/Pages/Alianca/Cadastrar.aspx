<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="Pages_Alianca_Cadastrar" %>

<%@ Register src="../../Content/Cabecalho.ascx" tagname="Cabecalho" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastrar Aliança</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>  
</head>
<body>
    <form id="form1" runat="server" role="form">
    <div class="container-fluid">
        <uc1:Cabecalho ID="Cabecalho1" runat="server" />
        <asp:Label ID="lblTitulo" runat="server" Text="Cadastro de Aliança:"></asp:Label>
        <asp:ValidationSummary ID="vsMensagem" runat="server" CssClass="has-error alert-warning text-warning bg-warning" />
        <div class="form-group">
        <asp:Label ID="lblModelo" runat="server" Text="Modelo:"></asp:Label>
        <asp:DropDownList ID="ddlModelo" runat="server" DataTextField="MOD_NOME" DataValueField="MOD_ID"  CssClass="form-control">
        </asp:DropDownList>
        </div>
        <div class="form-group">
        <asp:Label ID="lblTamanho" runat="server" Text="Tamanho:"></asp:Label>
        <asp:DropDownList ID="ddlTamanho" runat="server" DataTextField="MOD_NOME" DataValueField="MOD_ID"  CssClass="form-control">
        </asp:DropDownList>
        </div>
        <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Voltar" CssClass="btn btn-default" CausesValidation="False"/>
        <asp:Button ID="btnCadastrar" runat="server" OnClick="btnCadastrar_Click" Text="Cadastrar" CssClass="btn btn-default"/>

        <br />
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
