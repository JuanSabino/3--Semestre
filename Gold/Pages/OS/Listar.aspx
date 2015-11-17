<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_OS_Listar" %>

<%@ Register Src="../../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" title="Ordens de Serviço">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="" class="container-fluid">



            <uc1:Cabecalho ID="Cabecalho1" runat="server" />
            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Ordens de Serviço:"></asp:Label></h3>
            <asp:Button ID="btnAbrir" runat="server" OnClick="btnAbrir_Click" Text="Abrir OS" CssClass="btn btn-default" />

            <asp:Label ID="lblMensagem" runat="server" CssClass="has-error alert-warning text-warning bg-warning"></asp:Label>
            <br />
            <asp:GridView ID="gvOS" runat="server" AutoGenerateColumns="False" OnRowCommand="gvOS_RowCommand" CssClass="table table-striped table-bordered table-hover table-responsive">

                <Columns>
                    <asp:BoundField DataField="OS_ID" HeaderText="CÓDIGO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OS_DATAENTRADA" HeaderText="DATA ENTRADA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OS_DATASAIDA" HeaderText="DATA SAÍDA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OS_LOJA" HeaderText="LOJA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OS_OBS" HeaderText="OBSERVAÇÃO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="OS_ATIVADO" HeaderText="ATIVADO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbFechar" runat="server" CommandName="fechar" CommandArgument='<%# Bind("OS_ID") %>'>FINALIZAR OS</asp:LinkButton>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <h4>
                <asp:Label ID="lblVazio" runat="server" Text=""></asp:Label></h4>
            <hr />



            <asp:GridView ID="gvFinalizados" runat="server" AutoGenerateColumns="False"  CssClass="table table-striped table-bordered table-hover table-responsive">

                <Columns>
                    <asp:BoundField DataField="OS_ID" HeaderText="CÓDIGO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OS_DATAENTRADA" HeaderText="DATA ENTRADA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OS_DATASAIDA" HeaderText="DATA SAÍDA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OS_LOJA" HeaderText="LOJA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="OS_OBS" HeaderText="OBSERVAÇÃO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="OS_ATIVADO" HeaderText="ATIVADO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                </Columns>
            </asp:GridView>



        </div>
    </form>
</body>
</html>
