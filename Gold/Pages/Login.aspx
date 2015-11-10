<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/Content/bootstrap.min.css"   />
    <script src="../Scripts/jquery-2.1.4.min.js" ></script>
    <script src="../Scripts/bootstrap.min.js" ></script>
</head>
<body>
    <form id="form1" runat="server">
        <!--Controller de login do winforms
            Ja possui dois textbox e um botao.
            Texto do primeiro textbox fica armazenado na propriedade UserName
            Texto do segundo textbox fica armazenado na propriedade Password
         -->

    <div class="form-group container">
    
        <asp:ValidationSummary ID="vsMensagem" runat="server" CssClass="has-error text-warning bg-warning" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="CPF:" Width="50px"></asp:Label>
        <asp:TextBox ID="txtCpf" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCpf" runat="server" ControlToValidate="txtCpf" ErrorMessage="CPF obrigatório!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Senha:" Width="50px"></asp:Label>
        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSenha" runat="server" ControlToValidate="txtSenha" ErrorMessage="Senha obrigatória!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        <br />
        <p class="text-warning bg-warning">
            <asp:Label ID="lblMensagem" runat="server" CssClass="text-warning"></asp:Label>

        </p>
        
        <br />
        <asp:Button ID="btnLogar" runat="server" OnClick="btnLogar_Click" Text="Logar" CssClass="btn btn-default" />
    
    </div>
    </form>
</body>
</html>
