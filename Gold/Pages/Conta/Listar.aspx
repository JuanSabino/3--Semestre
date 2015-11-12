<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Conta_Listar" %>

<%@ Register src="../../Content/Cabecalho.ascx" tagname="Cabecalho" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" title="Contas">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script> 
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">

        <uc1:Cabecalho ID="Cabecalho1" runat="server" />

        <h3><asp:Label ID="lblTitulo" runat="server" Text="Contas"></asp:Label></h3>

        <asp:GridView ID="gvConta" runat="server" AutoGenerateColumns="False"  OnSelectedIndexChanged="gvConta_SelectedIndexChanged" CssClass="table table-striped table-bordered table-hover table-responsive">

            <Columns>
                  <asp:BoundField DataField="CON_NOME"  HeaderText="CONTA" DataFormatString="{0:C}" >
                  <ItemStyle  VerticalAlign="Middle" />
                </asp:BoundField>
                  <asp:CheckBoxField DataField="CON_ATIVADO" HeaderText="ATIVADO">
                  <ItemStyle  VerticalAlign="Middle" />
                  </asp:CheckBoxField>
            </Columns>
        </asp:GridView>

    </div>
    </form>
</body>
</html>
