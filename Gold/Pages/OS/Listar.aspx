<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_OS_Listar" %>

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
    


        <asp:Label ID="lblTitulo" runat="server" Text="Ordens de Serviço:"></asp:Label>
        <br />
        <asp:Button ID="btnAbrir" runat="server" OnClick="btnAbrir_Click" Text="Abrir OS" />
        <br />

         <asp:GridView ID="gvOS" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="30px" Width="100%" style="margin-right: 101px" OnRowCommand="gvOS_RowCommand">

            <Columns>
<asp:BoundField DataField="OS_ID" HeaderText="CÓDIGO">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="OS_DATAENTRADA" HeaderText="DATA ENTRADA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="OS_DATASAIDA" HeaderText="DATA SAÍDA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="OS_LOJA" HeaderText="LOJA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="OS_OBS" HeaderText="OBSERVAÇÃO" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:CheckBoxField DataField="OS_ATIVADO" HeaderText="ATIVADO" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:CheckBoxField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbFechar" runat="server" CommandName="fechar" CommandArgument='<%# Bind("OS_ID") %>' >FINALIZAR OS</asp:LinkButton>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                </asp:TemplateField> 
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
