﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fechar.aspx.cs" Inherits="Pages_Atividades_Fechar" %>

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
        <asp:TextBox ID="txtID" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="Label7" runat="server" Text="OS:"></asp:Label>
        <br />
        <asp:TextBox ID="txtOS" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="Label8" runat="server" Text="Aliança:"></asp:Label>
        <br />
        <asp:TextBox ID="txtAlianca" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="label9" runat="server" Text="Entrada (gramas):"></asp:Label>
        <br />
        <asp:TextBox ID="txtEntrada" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="label10" runat="server" Text="Obs (Entrada):"></asp:Label>
        <br />
        <asp:TextBox ID="txtObsEntrada" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="label11" runat="server" Text="Inicio:"></asp:Label>
        <br />
        <asp:TextBox ID="txtInicio" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Funcionário:"></asp:Label>
        <br />
        <asp:TextBox ID="txtFuncionario" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="label12" runat="server" Text="Máquina:"></asp:Label>
        <br />
        <asp:TextBox ID="txtMaquina" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Conta:"></asp:Label>
        <br />
        <asp:TextBox ID="txtConta" runat="server" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Saída (gramas):"></asp:Label>
        <br />
        <asp:TextBox ID="txtSaida" runat="server" EnableTheming="True"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Observação:"></asp:Label>
        <br />
        <asp:TextBox ID="txtObsSaida" runat="server" EnableTheming="True"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />
        <asp:Button ID="btnFinalizar" runat="server" OnClick="btnFinalizar_Click" Text="Finalizar" />
        <br />

    </form>
</body>
</html>
