<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fechar.aspx.cs" Inherits="Pages_OS_Fechar" %>

<%@ Register Src="~/Content/Cabecalho.ascx" TagPrefix="uc1" TagName="Cabecalho" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" title="Encerrar Ordem de Serviço" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script> 
</head>
<body>
    <form id="form1" runat="server" role="form">
    <div class="container-fluid">
        <uc1:Cabecalho runat="server" ID="Cabecalho" />
    
        <h3><asp:Label ID="Label5" runat="server" Text="Fechar OS"></asp:Label></h3>
        <div class="form-group">
        <asp:Label ID="lblId" runat="server" Text="ID:"></asp:Label>
        <asp:TextBox ID="txtId" runat="server" Enabled="False" EnableTheming="True" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="lblAbertura" runat="server" Text="Data Abertura"></asp:Label>
        <asp:TextBox ID="txtAbertura" runat="server" Enabled="False" EnableTheming="True" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="lblLoja" runat="server" Text="Loja:"></asp:Label>
        <asp:TextBox ID="txtLoja" runat="server" Enabled="False" EnableTheming="True" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="lblObs" runat="server" Text="Observacao:"></asp:Label>
        <asp:TextBox ID="txtObs" runat="server" Enabled="False" EnableTheming="True" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" CssClass="btn btn-default" CausesValidation="False" />
        <asp:Button ID="btnFinalizar" runat="server" OnClick="btnFinalizar_Click" Text="Finalizar" CssClass="btn btn-default" />
        <br />
    </div>
    </form>
</body>
</html>
