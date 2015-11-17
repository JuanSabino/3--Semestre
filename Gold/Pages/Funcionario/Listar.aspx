<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Funcionario_Listar" %>

<%@ Register Src="../../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" title="Funcionários" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <uc1:Cabecalho ID="Cabecalho1" runat="server" />
            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Funcionários"></asp:Label></h3>
            <asp:GridView ID="gvFuncionario" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive">
                <Columns>
                    <asp:BoundField DataField="FUN_NOME" HeaderText="Nome" DataFormatString="{0:C}"></asp:BoundField>
                    <asp:BoundField DataField="FUN_CPF" HeaderText="CPF"></asp:BoundField>
                    <asp:BoundField DataField="CAR_NOME" HeaderText="CARGO" />
                    <asp:CheckBoxField DataField="CAR_ATIVADO" HeaderText="ATIVO" />
                </Columns>
            </asp:GridView>
            <h4>
                <asp:Label ID="lblVazio" runat="server" Text=""></asp:Label></h4>
        </div>
    </form>
</body>
</html>
