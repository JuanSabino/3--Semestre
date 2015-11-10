<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Config.aspx.cs" Inherits="Pages_Relatorios_OSPorPeriodo_Config" %>

<%@ Register src="../../../Content/Cabecalho.ascx" tagname="Cabecalho" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous" />

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>
</head>
<body>
    <uc1:Cabecalho ID="Cabecalho1" runat="server" />
    <form id="form1" runat="server">
        
    <div>
    
        <asp:Label ID="lblTitulo" runat="server" Text="Relatorio de Modelos Vendidos:"></asp:Label>
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
        <br />
        <asp:Button ID="btnGerar" runat="server" OnClick="btnGerar_Click" Text="Gerar" />
        <br />
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
