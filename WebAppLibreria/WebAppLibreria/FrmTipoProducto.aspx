<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmTipoProducto.aspx.cs" Inherits="WebAppLibreria.FrmTipoProducto1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="gvTipoProductos" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns ="False" >
        <Columns>
                <asp:HyperLinkField HeaderText="Codigo"
                    DataTextField="Codigo"
                    DataNavigateUrlFields="Id"
                    DataNavigateUrlFormatString="FrmEditarTipoProducto.aspx?uid={0}"/>
                <asp:BoundField HeaderText="Nombre"
                    DataField="Nombre" />
                <asp:BoundField HeaderText="Descripcion"
                    DataField="Descripcion" />
                <asp:TemplateField ShowHeader="false">
                    <ItemTemplate>
                        <asp:ImageButton 
                            ID="btnEliminar"
                            runat="server"
                            ImageUrl="~/Imagen/IC82740.png"
                            OnClientClick="return confirm('¿Esta seguro de Eliminar?');"
                            CommandName="Eliminar"
                            CommandArgument='<%#Eval("Id")%>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
    </div>
        <asp:HyperLink ID="HlAgregar" runat="server" NavigateUrl="~/FrmCrearTipoProducto.aspx">Agregar TipoProducto</asp:HyperLink>
    </form>
</body>
</html>
