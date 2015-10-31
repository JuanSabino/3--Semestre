<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Listar.aspx.cs" Inherits="Pages_Maquina_Listar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="Lista de maquinas:"></asp:Label>
        <br />
        <asp:GridView ID="gvMaquinas" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="MAQ_NOME" HeaderText="Maquina" />
                <asp:CheckBoxField DataField="MAQ_ATIVADO" HeaderText="Ativado?" />
            </Columns>
        </asp:GridView>
        
    
    </div>
    </form>
</body>
</html>
