<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="Pages_OS_Cadastrar" %>

<%@ Register Src="../../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js" title="Iniciar Ordem de Serviço"></script>
</head>
<body>
    <form id="form1" runat="server" role="form">
        <div class="container-fluid">
            <uc1:Cabecalho runat="server" ID="Cabecalho" />

            <asp:Label ID="lblTitulo" runat="server" Text="Cadastrar Ordem de Serviço:"></asp:Label>

            <br />

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="has-error alert-warning text-warning bg-warning" />

            <br />
            <div class="form-group">
                <asp:Label ID="lblOS" runat="server" Text="OS:"></asp:Label>
                <asp:TextBox ID="txtOs" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblLoja" runat="server" Text="Loja:"></asp:Label>
                <asp:TextBox ID="txtLoja" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLoja" runat="server" ControlToValidate="txtLoja" ErrorMessage="Digite a Loja!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="lblObs" runat="server" Text="Observação:"></asp:Label>
                <asp:TextBox ID="txtObs" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <hr />
            <div class="form-group">
                <asp:Label ID="lblAlianca" runat="server" Text="Alianças:"></asp:Label>
                <br />
                <asp:Button ID="btnAddAlianca" runat="server" Text="Adicionar Alianca" OnClick="btnAddAlianca_Click" CssClass="btn btn-default" />
                <asp:GridView ID="gvAlianca" runat="server" AutoGenerateColumns="False" Width="100%" OnSelectedIndexChanged="gvAlianca_SelectedIndexChanged" CssClass="table table-striped table-bordered table-hover table-responsive">
                    <Columns>
                        <asp:BoundField DataField="MOD_NOME" HeaderText="MODELO">
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ALI_TAMANHO" HeaderText="TAMANHO">
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MOD_PESO" HeaderText="PESO">
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MOD_LARGURA" HeaderText="LARGURA">
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="MOD_ALTURA" HeaderText="ALTURA">
                            <ItemStyle VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField Visible="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbExcluir" runat="server" CommandName="apagar" CommandArgument='<%# Bind("ALI_ID") %>' OnClientClick="javascript: return confirm('Deseja excluir?')">REMOVER</asp:LinkButton>
                            </ItemTemplate>

                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <hr />
            <asp:Button ID="btncancelar" runat="server" OnClick="btncancelar_Click" Text="Cancelar" ValidateRequestMode="Disabled" CssClass="btn btn-default" CausesValidation="False" />
            <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="btn btn-default" />
            <br />
            <asp:Label ID="lblMensagem" runat="server" CssClass="has-error alert-warning text-warning bg-warning"></asp:Label>


        </div>
    </form>
</body>
</html>
