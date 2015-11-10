<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Relatorio.aspx.cs" Inherits="Pages_Relatorios_OSPorPeriodo_Relatorio" %>

<%@ Register Src="~/Content/Cabecalho.ascx" TagPrefix="uc1" TagName="Cabecalho" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <uc1:Cabecalho runat="server" ID="Cabecalho" />
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="&lt;b&gt;Parâmetros:&lt;/b&gt;"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Data Inicial:" Width="100px"></asp:Label>
        <asp:Label ID="lblInicial" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Data Final:" Width="100px"></asp:Label>
        <asp:Label ID="lblFinal" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Ordenado por:" Width="100px"></asp:Label>
        <asp:Label ID="lblOrdem" runat="server"></asp:Label>
        <br />
    <hr />
        <asp:GridView ID="gvRelatorio" runat="server" AutoGenerateColumns="False" Width="80%">
            <Columns>
                <asp:BoundField DataField="OrderServico" HeaderText="Nº OS" />
                <asp:BoundField DataField="Loja" HeaderText="LOJA" />
                <asp:BoundField DataField="Alianca" HeaderText="COD ALIANÇA" />
                <asp:BoundField DataField="Modelo" HeaderText="MODELO" />
                <asp:BoundField DataField="Tamanho" HeaderText="TAMANHO" />
                <asp:BoundField DataField="Peso" HeaderText="PESO" />
                <asp:BoundField DataField="Detalhes" HeaderText="DETALHES" />
                <asp:BoundField DataField="DataAbertura" HeaderText="DATA ABERTURA" DataFormatString="{0:d}" />
                <asp:BoundField DataField="DataEncerramento" HeaderText="DATA ENCERRAMENTO" DataFormatString="{0:d}" />
                <asp:BoundField DataField="DiasAbertos" HeaderText="DIAS EM ABERTO" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
