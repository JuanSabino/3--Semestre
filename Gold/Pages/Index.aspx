<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Pages_Index" %>

<%@ Register Src="../Content/Cabecalho.ascx" TagName="Cabecalho" TagPrefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Página Inicial</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="~/Content/bootstrap.min.css" />
    <script src="../Scripts/jquery-2.1.4.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">

        <div class="container-fluid">
            <uc1:Cabecalho ID="Cabecalho1" runat="server" />
        </div>
    </form>
</body>
</html>
