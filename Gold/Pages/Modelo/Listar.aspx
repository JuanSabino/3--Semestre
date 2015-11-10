<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Modelo_Listar" %>

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
    <asp:Label ID="lblTitulo" runat="server" Text="Modelos de Alianças:"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gvModelo" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="30px" Width="334px">
            <Columns>
                <asp:BoundField DataField="MOD_NOME" HeaderStyle-ForeColor="WhiteSmoke" HeaderText="NOME" DataFormatString="{0:C}" >
<HeaderStyle ForeColor="WhiteSmoke"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_PESO" HeaderStyle-ForeColor="WhiteSmoke" HeaderText="PESO" >
<HeaderStyle ForeColor="WhiteSmoke"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_FERRAMENTA" HeaderText="FERRAMENTA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_DESCRICAO" HeaderText="DESCRIÇÃO" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_LARGURA" HeaderText="LARGURA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_ALTURA" HeaderText="ALTURA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="MOD_ATIVADO" HeaderText="ATIVO" >
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
