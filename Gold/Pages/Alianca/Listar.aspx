<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Alianca_Listar" %>

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
    <div >
        <uc1:Cabecalho ID="Cabecalho1" runat="server" />
        <br />
        <br />
    <asp:Label ID="lblTitulo" runat="server" Text="Lista de Alianças:"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gvAlianca" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="30px" Width="100%" CssClass="table table-striped table-bordered table-hover table-responsive" OnSelectedIndexChanged="gvAlianca_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="OS_ID" HeaderText="ORDEM DE SERVIÇO"  >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle  VerticalAlign="Middle" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ALI_PRODUTO" HeaderText="PRODUTO" >
                <ItemStyle  VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_NOME" HeaderStyle-ForeColor="WhiteSmoke" HeaderText="MODELO" DataFormatString="{0:C}" >
<HeaderStyle ForeColor="WhiteSmoke"></HeaderStyle>
                <ItemStyle  VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_PESO" HeaderStyle-ForeColor="WhiteSmoke" HeaderText="PESO" >
<HeaderStyle ForeColor="WhiteSmoke"></HeaderStyle>
                <ItemStyle  VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_FERRAMENTA" HeaderText="FERRAMENTA" >
                <ItemStyle  VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_DESCRICAO" HeaderText="DESCRIÇÃO" >
                <ItemStyle  VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_LARGURA" HeaderText="LARGURA" >
                <ItemStyle  VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_ALTURA" HeaderText="ALTURA" >
                <ItemStyle  VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="ALI_ATIVADO" HeaderText="ATIVADO" >
                <ItemStyle  VerticalAlign="Middle" Width="50px" />
                </asp:CheckBoxField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
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
