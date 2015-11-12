<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Modelo_Listar" %>

<%@ Register Src="../../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</head>
<body title="Modelos de Aliança">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <uc1:Cabecalho ID="Cabecalho1" runat="server" />
            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Modelos de Alianças"></asp:Label></h3>
            <asp:GridView ID="gvModelo" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvModelo_SelectedIndexChanged" CssClass="table table-striped table-bordered table-hover table-responsive">
                <Columns>
                    <asp:BoundField DataField="MOD_NOME" HeaderText="NOME" DataFormatString="{0:C}">
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
                    <asp:CheckBoxField DataField="MOD_ATIVADO" HeaderText="ATIVO">
                        <ItemStyle VerticalAlign="Middle" />
                    </asp:CheckBoxField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
