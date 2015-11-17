<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Relatorio.aspx.cs" Inherits="Pages_Relatorios_Perdas_Relatorio" %>

<%@ Register Src="~/Content/Cabecalho.ascx" TagPrefix="uc1" TagName="Cabecalho" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" title="Relatório de Perdas">
    <title></title>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js" title="Relatório de Perdas"></script>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container-fluid">
            <uc1:Cabecalho runat="server" ID="Cabecalho" />
            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Relatório de Perdas:"></asp:Label></h3>
            <div class="jumbotron">
                <h4>
                    <asp:Label ID="lblParametro" runat="server" Text="Parametros:"></asp:Label></h4>
                <asp:Label ID="lblInicio" runat="server" Text="Data Inicial:" Width="100px"></asp:Label>
                <asp:Label ID="lblInicial" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblFim" runat="server" Text="Data Final:" Width="100px"></asp:Label>
                <asp:Label ID="lblFinal" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblord" runat="server" Text="Ordenado por:" Width="100px"></asp:Label>
                <asp:Label ID="lblOrdem" runat="server"></asp:Label>
            </div>
            <hr />

        </div>
        <asp:Table ID="tblRelatorio" runat="server" CellPadding="5" CellSpacing="5" Width="100%" CssClass="table table-striped table-responsive">
        </asp:Table>
        <h4>
            <asp:Label ID="lblVazio" runat="server" Text=""></asp:Label></h4>
    </form>
</body>
</html>
