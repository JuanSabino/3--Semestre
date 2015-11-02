<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fechar.aspx.cs" Inherits="Pages_OS_Fechar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Fechar OS<br />
    
    </div>
        <asp:Label ID="Label1" runat="server" Text="ID:"></asp:Label>
        <br />
        <asp:TextBox ID="txtId" runat="server" Enabled="False" EnableTheming="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Data Abertura"></asp:Label>
        <br />
        <asp:TextBox ID="txtAbertura" runat="server" Enabled="False" EnableTheming="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Loja:"></asp:Label>
        <br />
        <asp:TextBox ID="txtLoja" runat="server" Enabled="False" EnableTheming="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Observacao:"></asp:Label>
        <br />
        <asp:TextBox ID="txtObs" runat="server" Enabled="False" EnableTheming="True"></asp:TextBox>
        <br />
        <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
        <asp:Button ID="btnFinalizar" runat="server" OnClick="btnFinalizar_Click" Text="Finalizar" />
        <br />
    </form>
</body>
</html>
