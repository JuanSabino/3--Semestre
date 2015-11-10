﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Relatorio.aspx.cs" Inherits="Pages_Relatorios_OSPorPeriodo_Relatorio" %>

<%@ Register Src="~/Content/Cabecalho.ascx" TagPrefix="uc1" TagName="Cabecalho" %>




<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>




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
    <form id="form1" runat="server">
    <uc1:Cabecalho runat="server" ID="Cabecalho" />
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="&lt;b&gt;Parâmetros:&lt;/b&gt;"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Data Inicial:" Width="100px"></asp:Label>
        <asp:Label ID="lblInicial" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Data Final:" Width="100px"></asp:Label>
        <asp:Label ID="lblFinal" runat="server"></asp:Label>
        <br />
    <hr />

    <asp:Chart ID="crtRelatorio" runat="server" Width="800px" >
        <series>
            <asp:Series Name="Default" ChartType="Pie" Legend="Legend1">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
    <Legends><asp:Legend Name="Legend1" Title="MODELOS"></asp:Legend></Legends></asp:Chart>


        <asp:GridView ID="gvRelatorio" runat="server" AutoGenerateColumns="False" Width="80%" OnSelectedIndexChanged="gvRelatorio_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Modelo" HeaderText="MODELO" />
                <asp:BoundField DataField="Quantidade" HeaderText="QUANTIDADE" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>