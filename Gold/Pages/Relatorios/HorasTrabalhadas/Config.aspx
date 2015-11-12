<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Config.aspx.cs" Inherits="Pages_Relatorios_HorasTrabalhadas_Config" %>

<%@ Register Src="../../../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
</head>
<body title="Relatório de Perdas">

    <form id="form1" runat="server">

        <div class="container-fluid">
            <uc1:Cabecalho ID="Cabecalho1" runat="server" />
            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Relatório de Perdas:"></asp:Label></h3>
            <h4>
                <asp:Label ID="lblParametro" runat="server" Text="Parametros:"></asp:Label></h4>
            <asp:ValidationSummary ID="vsMensagem" runat="server" CssClass="has-error alert-warning text-warning bg-warning" />
            <br />
            <div class="form-group">
                <asp:Label ID="lblDataInicial" runat="server" Text="Data Inicial:"></asp:Label>
                <asp:TextBox ID="txtDataInicial" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDataInicial" runat="server" ControlToValidate="txtDataInicial" ErrorMessage="Digite a data inicial!" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="lblDataFinal" runat="server" Text="Data Final:"></asp:Label>
                <asp:TextBox ID="txtDataFinal" runat="server" Height="23px" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDataFInal" runat="server" ControlToValidate="txtDataFinal" ErrorMessage="Digite a datafinal!" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvDataFinal" runat="server" ControlToCompare="txtDataInicial" ControlToValidate="txtDataFinal" ErrorMessage="Data final deve ser maior que data inicial!" Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date">*</asp:CompareValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="lblClassifica" runat="server" Text="Classificar por:"></asp:Label>
                <asp:DropDownList ID="ddlClassifica" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnGerar" runat="server" OnClick="btnGerar_Click" Text="Gerar" CssClass="btn btn-default" />
            <br />
            <asp:Label ID="lblMensagem" runat="server" CssClass="has-error alert-warning text-warning bg-warning"></asp:Label>

        </div>
    </form>
</body>
</html>
