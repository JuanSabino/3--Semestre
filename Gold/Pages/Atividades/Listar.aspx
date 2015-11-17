<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Atividades_Listar" %>

<%@ Register Src="../../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
</head>
<body title="Atividades">
    <form id="form1" runat="server">
        <div class="container-fluid">

            <uc1:Cabecalho ID="Cabecalho1" runat="server" />

            <h3>
                <asp:Label ID="lblTitulo" runat="server" Text="Atividades"></asp:Label></h3>
            <br />
            <asp:Button ID="btnIniciar" runat="server" OnClick="btnAbrir_Click" Text="Iniciar Atividade" CssClass="btn btn-default" />
            <br />
            <asp:Label ID="lblMensagem" runat="server" CssClass="has-error alert-warning text-warning bg-warning"></asp:Label>
            <br />

            <asp:GridView ID="gvAtividade" runat="server" AutoGenerateColumns="False" OnRowCommand="gvAtividade_RowCommand" CssClass="table table-striped table-bordered table-hover table-responsive">

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
                    <asp:TemplateField HeaderText="ENCERRAR">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbFechar" runat="server" CommandName="fechar" CommandArgument='<%# Bind("ALC_ID") %>'><i class="fa fa-times"></i></asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <h4>
                <asp:Label ID="lblVazio" runat="server" Text=""></asp:Label></h4>
            <hr />
            <asp:GridView ID="gvEncerradas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover table-responsive">

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
                </Columns>
            </asp:GridView>



        </div>
    </form>
</body>
</html>
