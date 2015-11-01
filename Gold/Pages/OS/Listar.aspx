<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_OS_Listar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    


        <asp:Label ID="Label2" runat="server" Text="Lista de Ordens de Serviço"></asp:Label>
        <br />
        <br />

         <asp:GridView ID="gvOS" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="30px" Width="642px" style="margin-right: 101px">

            <Columns>
                <asp:BoundField DataField="OS_DATAENTRADA" HeaderText="DATA ENTRADA" />
                <asp:BoundField DataField="OS_DATASAIDA" HeaderText="DATA SAÍDA" />
                <asp:BoundField DataField="OS_LOJA" HeaderText="LOJA" />
                <asp:BoundField DataField="OS_OBS" HeaderText="OBSERVAÇÃO" />
                <asp:CheckBoxField DataField="OS_ATIVADO" HeaderText="ATIVADO?" />
            </Columns>


            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

        </asp:GridView>



    </div>
    </form>
</body>
</html>
