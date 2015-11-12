<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Cabecalho.ascx.cs" Inherits="Content_Cabecalho" %>



<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Alianca/Listar.aspx">Alianças</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Pages/Atividades/Listar.aspx">Atividades</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Pages/Conta/Listar.aspx">Contas</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Pages/Funcionario/Listar.aspx">Funcionários</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Pages/Maquina/Listar.aspx">Máquinas</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Pages/Modelo/Listar.aspx">Modelos</asp:HyperLink></li>
        <li><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Pages/OS/Listar.aspx">Ordens de Serviço</asp:HyperLink></li>
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Relatórios <span class="caret"></span></a>
          <ul class="dropdown-menu">
              <ul class="nav navbar-nav">
            <li><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Pages/Relatorios/ModelosVendidos/Config.aspx">Modelos Vendidos</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Pages/Relatorios/OSPorPeriodo/Config.aspx">Ordens de Serviço</asp:HyperLink></li>
            <li><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Pages/Relatorios/Perdas/Config.aspx">Total de Perdas</asp:HyperLink></li>
            </ul>
        </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>