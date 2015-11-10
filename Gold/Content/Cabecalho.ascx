<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Cabecalho.ascx.cs" Inherits="Content_Cabecalho" %>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <ul class="nav navbar-nav">
        <li><asp:HyperLink ID="hlAlianca" runat="server" NavigateUrl="~/Pages/Alianca/Listar.aspx">Alianças</asp:HyperLink></li>
        <li><asp:HyperLink ID="hlAtividade" runat="server" NavigateUrl="~/Pages/Atividades/Listar.aspx">Atividades</asp:HyperLink></li>
        <li><asp:HyperLink ID="hlConta" runat="server" NavigateUrl="~/Pages/Conta/Listar.aspx">Contas</asp:HyperLink></li>
        <li><asp:HyperLink ID="hlFuncionario" runat="server" NavigateUrl="~/Pages/Funcionario/Listar.aspx">Funcionários</asp:HyperLink></li>
        <li><asp:HyperLink ID="hlMaquina" runat="server" NavigateUrl="~/Pages/Maquina/Listar.aspx">Máquinas</asp:HyperLink></li>
        <li><asp:HyperLink ID="hlModelo" runat="server" NavigateUrl="~/Pages/Modelo/Listar.aspx">Modelos</asp:HyperLink></li>
        <li><asp:HyperLink ID="hlOS" runat="server" NavigateUrl="~/Pages/OS/Listar.aspx">Ordens de Serviço</asp:HyperLink></li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Relatórios</a>
            <ul class="dropdown-menu">
                <ul class="nav navbar-nav">
                    <li><asp:HyperLink ID="hlModelosVendidos" runat="server" NavigateUrl="~/Pages/Relatorios/ModelosVendidos/Config.aspx">Modelos Vendidos</asp:HyperLink></li>
                    <li><asp:HyperLink ID="hlOSPorPeriodo" runat="server" NavigateUrl="~/Pages/Relatorios/OSPorPeriodo/Config.aspx">Ordens de Serviço</asp:HyperLink></li>
                </ul>
            </ul>
        </li>
    </ul>
</nav>