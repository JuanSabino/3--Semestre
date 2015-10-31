<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Funcionario_Listar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="Funcionários Cadastrados"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gdvListaFuncionarios" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="30px" Width="334px">
            <Columns>
                <asp:BoundField DataField="FUN_NOME" HeaderStyle-ForeColor="WhiteSmoke" HeaderText="Nome" DataFormatString="{0:C}" >
<HeaderStyle ForeColor="WhiteSmoke"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="FUN_CPF" HeaderStyle-ForeColor="WhiteSmoke" HeaderText="CPF" >
<HeaderStyle ForeColor="WhiteSmoke"></HeaderStyle>
                </asp:BoundField>
                <asp:BoundField DataField="CAR_NOME" HeaderText="CARGO" />
                <asp:CheckBoxField DataField="CAR_ATIVADO" HeaderText="ATIVO" />
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
