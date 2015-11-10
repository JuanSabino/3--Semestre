<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Config.aspx.cs" Inherits="Pages_Relatorios_OSPorPeriodo_Config" %>

<%@ Register src="../../../Content/Cabecalho.ascx" tagname="Cabecalho" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <uc1:Cabecalho ID="Cabecalho1" runat="server" />
    <form id="form1" runat="server">
        
    <div>
    
        <asp:Label ID="lblTitulo" runat="server" Text="Relatorio de OS por Periodo:"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblParametro" runat="server" Text="Parametros:"></asp:Label>
        <br />
        <asp:ValidationSummary ID="vsMensagem" runat="server" />
        <br />
        <br />
        <asp:Label ID="lblDataInicial" runat="server" Text="Data Inicial:"></asp:Label>
        <br />
        <asp:TextBox ID="txtDataInicial" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDataInicial" runat="server" ControlToValidate="txtDataInicial" ErrorMessage="Digite a data inicial!" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblDataFinal" runat="server" Text="Data Final:"></asp:Label>
        <br />
        <asp:TextBox ID="txtDataFinal" runat="server" Height="23px" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDataFInal" runat="server" ControlToValidate="txtDataFinal" ErrorMessage="Digite a datafinal!" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblClassifica" runat="server" Text="Classificar por:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlClassifica" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnGerar" runat="server" OnClick="btnGerar_Click" Text="Gerar" />
        <br />
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
