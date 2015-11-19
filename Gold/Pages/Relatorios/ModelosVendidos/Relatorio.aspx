<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Relatorio.aspx.cs" Inherits="Pages_Relatorios_OSPorPeriodo_Relatorio" %>

<%@ Register Src="~/Content/Cabecalho.ascx" TagPrefix="uc1" TagName="Cabecalho" %>




<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" title="Relatório de Modelos Vendidos">
    <title></title>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container-fluid">
            <uc1:Cabecalho runat="server" ID="Cabecalho" />
            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Relatorio de Modelos Vendidos"></asp:Label></h3>
            <div class="jumbotron">
                <h4>
                    <asp:Label ID="lblParametro" runat="server" Text="Parametros:"></asp:Label></h4>

                <asp:Label ID="lblInicio" runat="server" Text="Data Inicial:" Width="100px"></asp:Label>
                <asp:Label ID="lblInicial" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblFim" runat="server" Text="Data Final:" Width="100px"></asp:Label>
                <asp:Label ID="lblFinal" runat="server"></asp:Label>
            </div>
            <br />
            <hr />
            <asp:Chart ID="crtRelatorio" runat="server" Width="1180px" Height="703px">
                <Series>
                    <asp:Series Name="Default" ChartType="Pie" Legend="Legend1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1" Title="MODELOS"></asp:Legend>
                </Legends>
            </asp:Chart>
            <hr />
            <asp:GridView ID="gvRelatorio" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvRelatorio_SelectedIndexChanged" CssClass="table table-striped table-responsive">
                <Columns>
                    <asp:BoundField DataField="Modelo" HeaderText="MODELO" />
                    <asp:BoundField DataField="Quantidade" HeaderText="QUANTIDADE" />
                </Columns>
            </asp:GridView>
            <h4>
                <asp:Label ID="lblVazio" runat="server" Text=""></asp:Label></h4>
        </div>
    </form>
</body>
</html>
