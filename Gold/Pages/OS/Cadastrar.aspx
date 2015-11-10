<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="Pages_OS_Cadastrar" %>

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
        <uc1:Cabecalho runat="server" ID="Cabecalho" />

        <asp:Label ID="lblTitulo" runat="server" Text="Cadastrar Ordem de Servico:"></asp:Label>
    
        <br />
    
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    
        <br />
        <asp:Label ID="lblOS" runat="server" Text="OS:"></asp:Label>
        <br />
        <asp:TextBox ID="txtOs" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblLoja" runat="server" Text="Loja:"></asp:Label>
        <br />
        <asp:TextBox ID="txtLoja" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvLoja" runat="server" ControlToValidate="txtLoja" ErrorMessage="Digite a Loja!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblObs" runat="server" Text="Observação:"></asp:Label>
        <br />
        <asp:TextBox ID="txtObs" runat="server"></asp:TextBox>
        <br />
        <hr />
        <asp:Label ID="lblAlianca" runat="server" Text="Alianças:"></asp:Label>
        <br />
        <asp:Button ID="btnAddAlianca" runat="server" Text="Adicionar Alianca" OnClick="btnAddAlianca_Click" />
&nbsp;<asp:GridView ID="gvAlianca" runat="server" AutoGenerateColumns="False" Width="100%">
            <Columns>
                <asp:BoundField DataField="ALI_PRODUTO" HeaderText="ALIANÇA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="ALI_TAMANHO" HeaderText="TAMANHO" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_NOME" HeaderText="MODELO" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_PESO" HeaderText="PESO" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_LARGURA" HeaderText="LARGURA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="MOD_ALTURA" HeaderText="ALTURA" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbExcluir" runat="server" CommandName="apagar" CommandArgument='<%# Bind("ALI_ID") %>' OnClientClick="javascript: return confirm('Deseja excluir?')">REMOVER</asp:LinkButton>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                </asp:TemplateField>  
            </Columns>
        </asp:GridView>
        <hr />


        <asp:Button ID="btncancelar" runat="server" OnClick="btncancelar_Click" Text="Cancelar" />


        <asp:Button ID="btnSalvar" runat="server" OnClick="btnSalvar_Click" Text="Salvar" />


        <br />
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>


    </div>
    </form>
</body>
</html>
