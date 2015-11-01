<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="Pages_OS_Cadastrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Cadastrar Orderm de Servico"></asp:Label>
    
        <br />
        OS:<br />
        <asp:TextBox ID="txtOs" runat="server" Enabled="False"></asp:TextBox>
        <br />
        Loja:<br />
        <asp:TextBox ID="txtLoja" runat="server"></asp:TextBox>
        <br />
        Obs:<br />
        <asp:TextBox ID="txtObs" runat="server"></asp:TextBox>
        <hr />
        Aliancas:<br />
        <asp:Button ID="Button1" runat="server" Text="Adicionar Alianca" OnClick="Button1_Click" />
&nbsp;<asp:GridView ID="gvAlianca" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ALI_PRODUTO" HeaderText="ALIANCA" />
                <asp:BoundField DataField="ALI_TAMANHO" HeaderText="TAMANHO" />
                <asp:BoundField DataField="MOD_NOME" HeaderText="MODELO" />
                <asp:BoundField DataField="MOD_PESO" HeaderText="PESO" />
                <asp:BoundField DataField="MOD_LARGURA" HeaderText="LARGURA" />
                <asp:BoundField DataField="MOD_ALTURA" HeaderText="ALTURA" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbExcluir" runat="server" CommandName="apagar" CommandArgument='<%# Bind("ALI_ID") %>' OnClientClick="javascript: return confirm('Deseja excluir?')">REMOVER</asp:LinkButton>
                    </ItemTemplate>

                </asp:TemplateField>  
            </Columns>
        </asp:GridView>
        <hr />


        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" />


    </div>
    </form>
</body>
</html>
