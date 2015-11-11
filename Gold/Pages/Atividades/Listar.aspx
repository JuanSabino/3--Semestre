<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Atividades_Listar" %>

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
    
        <asp:Label ID="Label2" runat="server" Text="Lista de Atividades"></asp:Label>
        <br />
        <asp:Button ID="btnIniciar" runat="server" OnClick="btnAbrir_Click" Text="Iniciar Atividade" />
        <br />
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        <br />

         <asp:GridView ID="gvAtividade" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="30px" Width="100%" style="margin-right: 101px; margin-top: 0px;" OnRowCommand="gvAtividade_RowCommand">

            <Columns>
                <asp:BoundField DataField="OS_ID" HeaderText="OS" />
                <asp:BoundField DataField="FUN_NOME" HeaderText="FUNCIONARIO" />
                <asp:BoundField DataField="MAQ_NOME" HeaderText="MAQUINA" />
                <asp:BoundField DataField="CON_NOME" HeaderText="CONTA" />
                <asp:BoundField DataField="ALC_INICIO" HeaderText="DATA ABERTURA" />
                <asp:BoundField DataField="ALC_TERMINO" HeaderText="DATA ENCERRAMENTO" />
                <asp:BoundField DataField="ALC_OBSENTRADA" HeaderText="OBS ENTRADA" />
                <asp:BoundField DataField="ALC_OBSSAIDA" HeaderText="OBS SAÍDA" />
                <asp:CheckBoxField DataField="ALC_ATIVADO" HeaderText="ATIVADO" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbFechar" runat="server" CommandName="fechar" CommandArgument='<%# Bind("ALC_ID") %>' >FINALIZAR ATIVIDADE</asp:LinkButton>
                    </ItemTemplate>

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
