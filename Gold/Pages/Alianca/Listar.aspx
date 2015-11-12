<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Alianca_Listar" %>

<%@ Register Src="../../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alianças</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <uc1:Cabecalho ID="Cabecalho1" runat="server" />

            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Alianças"></asp:Label></h3>

            <asp:GridView ID="gvAlianca" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive" OnSelectedIndexChanged="gvAlianca_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="OS_ID" HeaderText="ORDEM DE SERVIÇO">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle VerticalAlign="Middle" Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOD_NOME" HeaderText="MODELO" DataFormatString="{0:C}">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOD_PESO" HeaderText="PESO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOD_DESCRICAO" HeaderText="DESCRIÇÃO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOD_LARGURA" HeaderText="LARGURA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MOD_ALTURA" HeaderText="ALTURA">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="ALI_ATIVADO" HeaderText="ATIVADO">
                        <ItemStyle VerticalAlign="Middle" Width="50px" />
                    </asp:CheckBoxField>
                </Columns>

            </asp:GridView>
        </div>
    </form>
</body>
</html>
