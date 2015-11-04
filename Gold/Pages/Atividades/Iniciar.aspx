<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Iniciar.aspx.cs" Inherits="Pages_Atividades_Iniciar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Entrada (gramas):"></asp:Label>
        <br />
        <asp:TextBox ID="txtEntrada" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Observação:"></asp:Label>
        <br />
        <asp:TextBox ID="txtObs" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Utiliza Aliança?"></asp:Label>
        <asp:RadioButtonList ID="rblAlianca" runat="server" OnSelectedIndexChanged="rblAlianca_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Selected="True" Value="1">SIM</asp:ListItem>
            <asp:ListItem Value="0">NÃO</asp:ListItem>
        </asp:RadioButtonList>
        <asp:GridView ID="gvAlianca" runat="server" AutoGenerateColumns="False" OnRowCommand="gvAlianca_RowCommand">
            <Columns>
                <asp:BoundField DataField="ALI_ID" HeaderText="CÓDIGO" />
                <asp:BoundField DataField="OS_ID" HeaderText="OS" />
                <asp:BoundField DataField="ALI_PRODUTO" HeaderText="ALIANCA" />
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
        <br />
        <asp:Label ID="Label4" runat="server" Text="Funcionário:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlFuncionario" runat="server" DataTextField="FUN_NOME" DataValueField="FUN_ID">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Conta:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlConta" runat="server" DataTextField="CON_NOME" DataValueField="CON_ID">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Maquina:"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlMaquina" runat="server" DataTextField="MAQ_NOME" DataValueField="MAQ_ID">
        </asp:DropDownList>
        <br />
    
        <br />
        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Button" />
    
        <br />
        <asp:Label ID="lblMensagem2" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
