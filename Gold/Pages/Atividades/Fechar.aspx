<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fechar.aspx.cs" Inherits="Pages_Atividades_Fechar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <div>
        Fechar Atividade <br />    
    </div>
        
        <br />
        <asp:Label ID="label1" runat="server" Text="ID: "></asp:Label>
        <br />
        <asp:Label ID="lblId" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Saída (gramas):"></asp:Label>
        <br />
        <asp:TextBox ID="txtSaida" runat="server" EnableTheming="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Observação:"></asp:Label>
        <br />
        <asp:TextBox ID="txtObs" runat="server" EnableTheming="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Funcionário:"></asp:Label>
        <br />
        <asp:Label ID="lblFuncionario" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
        <asp:Button ID="btnFinalizar" runat="server" OnClick="btnFinalizar_Click" Text="Finalizar" />
        <br />

    </form>
</body>
</html>
