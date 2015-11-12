﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fechar.aspx.cs" Inherits="Pages_Atividades_Fechar" %>

<%@ Register Src="~/Content/Cabecalho.ascx" TagPrefix="uc1" TagName="Cabecalho" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script> 
</head>
<body title="Encerrar Atividade">
    <form id="form1" runat="server">

    <div class="container-fluid">
        <uc1:Cabecalho runat="server" ID="Cabecalho" />
         <h3><asp:Label ID="lblTitulo" runat="server" Text="Fechar Atividade"></asp:Label></h3>
         <br />          
        <asp:ValidationSummary ID="vsMensagem" runat="server" CssClass="has-error alert-warning text-warning bg-warning" />
        <div class="form-group">
        <asp:Label ID="label1" runat="server" Text="ID: "></asp:Label>
        <asp:TextBox ID="txtID" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="Label7" runat="server" Text="OS:"></asp:Label>
        <asp:TextBox ID="txtOS" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="Label8" runat="server" Text="Aliança:"></asp:Label>
        <asp:TextBox ID="txtAlianca" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="label9" runat="server" Text="Entrada (gramas):"></asp:Label>
        <asp:TextBox ID="txtEntrada" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="label10" runat="server" Text="Obs (Entrada):"></asp:Label>
        <asp:TextBox ID="txtObsEntrada" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="label11" runat="server" Text="Inicio:"></asp:Label>
        <asp:TextBox ID="txtInicio" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="Label5" runat="server" Text="Funcionário:"></asp:Label>
        <asp:TextBox ID="txtFuncionario" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="label12" runat="server" Text="Máquina:"></asp:Label>
        <asp:TextBox ID="txtMaquina" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="Label6" runat="server" Text="Conta:"></asp:Label>
        <asp:TextBox ID="txtConta" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Saída (gramas):"></asp:Label>
        <asp:TextBox ID="txtSaida" runat="server" EnableTheming="True" CssClass="form-control"></asp:TextBox>
        <asp:CompareValidator ID="cvSaida" runat="server" ControlToCompare="txtEntrada" ControlToValidate="txtSaida" ErrorMessage="Saida deve ser menor que entrada!" Operator="GreaterThan" SetFocusOnError="True" Type="Double">*</asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSaida" ErrorMessage="Preencha o peso de saida!" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
        <asp:Label ID="Label4" runat="server" Text="Observação:"></asp:Label>
        <asp:TextBox ID="txtObsSaida" runat="server" EnableTheming="True" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" CssClass="btn btn-default" CausesValidation="False" />
        <asp:Button ID="btnFinalizar" runat="server" OnClick="btnFinalizar_Click" Text="Finalizar" CssClass="btn btn-default" />
        <br />
    </div>
    </form>
</body>
</html>
