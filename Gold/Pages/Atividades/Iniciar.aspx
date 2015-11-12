<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Iniciar.aspx.cs" Inherits="Pages_Atividades_Iniciar" %>

<%@ Register Src="~/Content/Cabecalho.ascx" TagPrefix="uc1" TagName="Cabecalho" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" title="Iniciar Atividade">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script> 
</head>
<body>
    <form id="form1" runat="server" role="form">
    <div class="container-fluid">
        <uc1:Cabecalho runat="server" ID="Cabecalho" />
        <asp:ValidationSummary ID="vsMensagem" runat="server" CssClass="has-error alert-warning text-warning bg-warning" />
        <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="Entrada (gramas):"></asp:Label>
        <asp:TextBox ID="txtEntrada" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvEntrada" runat="server" ControlToValidate="txtEntrada" ErrorMessage="Digite a entrada em gramas!" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Observação:"></asp:Label>
        <asp:TextBox ID="txtObs" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Utiliza Aliança?"></asp:Label>
        <asp:RadioButtonList ID="rblAlianca" runat="server" OnSelectedIndexChanged="rblAlianca_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Selected="True" Value="1">SIM</asp:ListItem>
            <asp:ListItem Value="0">NÃO</asp:ListItem>
        </asp:RadioButtonList>
        </div>

        <asp:GridView ID="gvAlianca" runat="server" AutoGenerateColumns="False" OnRowCommand="gvAlianca_RowCommand"  CssClass="table table-striped table-bordered table-hover table-responsive">
            <Columns>
                <asp:BoundField DataField="ALI_ID" HeaderText="CÓDIGO" />
                <asp:BoundField DataField="OS_ID" HeaderText="OS" />
                <asp:BoundField DataField="ALI_TAMANHO" HeaderText="TAMANHO" />
                <asp:BoundField DataField="MOD_NOME" HeaderText="MODELO" />
                <asp:BoundField DataField="MOD_PESO" HeaderText="PESO" />
                <asp:BoundField DataField="MOD_LARGURA" HeaderText="LARGURA" />
                <asp:BoundField DataField="MOD_ALTURA" HeaderText="ALTURA" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbSelecionar" runat="server" CommandName="selecionar" CommandArgument='<%# Bind("ALI_ID") %>'>SELECIONAR</asp:LinkButton>
                    </ItemTemplate>

                </asp:TemplateField>  
            </Columns>
        </asp:GridView>
            <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        <div class="form-group">
        <asp:Label ID="Label4" runat="server" Text="Funcionário:"></asp:Label>
        <asp:DropDownList ID="ddlFuncionario" runat="server" DataTextField="FUN_NOME" DataValueField="FUN_ID" CssClass="form-control">
        </asp:DropDownList>
        </div>
        <div class="form-group">
        <asp:Label ID="Label5" runat="server" Text="Conta:"></asp:Label>
        <asp:DropDownList ID="ddlConta" runat="server" DataTextField="CON_NOME" DataValueField="CON_ID" CssClass="form-control">
        </asp:DropDownList>
        </div>
        <div class="form-group">
        <asp:Label ID="Label6" runat="server" Text="Maquina:"></asp:Label>

        <asp:DropDownList ID="ddlMaquina" runat="server" DataTextField="MAQ_NOME" DataValueField="MAQ_ID" CssClass="form-control">
        </asp:DropDownList>
        </div>
        <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Voltar" CssClass="btn btn-default" CausesValidation="False" />
        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" CssClass="btn btn-default" />
    
        <br />
        <p class="has-error alert-warning text-warning bg-warning">
            <asp:Label ID="lblMensagem2" runat="server" CssClass="has-error alert-warning text-warning bg-warning"></asp:Label>
        </p>
    
    </div>
    </form>
</body>
</html>
