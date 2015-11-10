<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Maquina_Listar" %>

<%@ Register src="../../Content/Cabecalho.ascx" tagname="Cabecalho" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script> 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Cabecalho ID="Cabecalho1" runat="server" />
        <br />
        <br />
        <asp:Label ID="lblTitulo" runat="server" Text="Lista de maquinas:"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gvMaquina" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="MAQ_NOME" HeaderText="MAQUINA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="MAQ_ATIVADO" HeaderText="ATIVO" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CheckBoxField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        
    
    </div>
    </form>
</body>
</html>
