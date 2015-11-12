<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Maquina_Listar" %>

<%@ Register Src="../../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" title="Máquinas">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <uc1:Cabecalho ID="Cabecalho1" runat="server" />
            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Máquinas:"></asp:Label></h3>
            <asp:GridView ID="gvMaquina" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive">
                <Columns>
                    <asp:BoundField DataField="MAQ_NOME" HeaderText="MAQUINA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="MAQ_ATIVADO" HeaderText="ATIVO"></asp:CheckBoxField>
                </Columns>
            </asp:GridView>


        </div>
    </form>
</body>
</html>
