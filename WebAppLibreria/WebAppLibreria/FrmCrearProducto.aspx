<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmCrearProducto.aspx.cs" Inherits="WebAppLibreria.FrmCrearProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
    <form id="form1" runat="server" class="form-horizontal">
    <div class="form-group">
    
        <asp:Label ID="Label1" runat="server" Text="Nombre:" CssClass="col-lg-2 control-label"></asp:Label>
            <div class="col-lg-6">
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
    </div>
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Marca:" CssClass="col-lg-2 control-label"></asp:Label>
            <div class="col-lg-6">    
            <asp:DropDownList ID="ddlMarca" runat="server"></asp:DropDownList>
            </div>
    </div>
    <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Precio:" CssClass="col-lg-2 control-label"></asp:Label>
            <div class="col-lg-6">
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
    </div>
    <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Stock:" CssClass="col-lg-2 control-label"></asp:Label>
            <div class="col-lg-6">
            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
    </div>
    <div class="form-group">
        <asp:Label ID="Label5" runat="server" Text="TipoProducto:" CssClass="col-lg-2 control-label"></asp:Label>
            <div class="col-lg-6">    
            <asp:DropDownList ID="ddlTipoProducto" runat="server"></asp:DropDownList>
            </div>
    </div>
    <div class="form-group">
            <div class="col-lg-offset-2">
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" />
            <asp:Button ID="btnGrabar" runat="server" Text="Grabar" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
    </div>
</body>
</html>
