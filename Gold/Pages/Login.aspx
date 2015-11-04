<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <!--Controller de login do winforms
            Ja possui dois textbox e um botao.
            Texto do primeiro textbox fica armazenado na propriedade UserName
            Texto do segundo textbox fica armazenado na propriedade Password
         -->

    <div>
    
        <asp:ValidationSummary ID="vsMensagem" runat="server" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="CPF:" Width="50px"></asp:Label>
        <asp:TextBox ID="txtCpf" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCpf" runat="server" ControlToValidate="txtCpf" ErrorMessage="CPF obrigatório!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Senha:" Width="50px"></asp:Label>
        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="txtSenha" ErrorMessage="Senha obrigatória!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnLogar" runat="server" OnClick="btnLogar_Click" Text="Logar" />
    
    </div>
    </form>
</body>
</html>
