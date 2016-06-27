<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmMarca.aspx.cs" Inherits="WebAppLibreria.FrmMarca" %>

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
    
        <asp:GridView ID="gvMarcas" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns ="False" >
        <Columns>
                <asp:HyperLinkField HeaderText="Nombre"
                    DataTextField="Nombre"
                    DataNavigateUrlFields="Id"
                    DataNavigateUrlFormatString="FrmEditarMarca.aspx?uid={0}"/>
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
        <asp:HyperLink ID="hlAgregar" runat="server">Agregar Marca</asp:HyperLink>
        <asp:DataList ID="dlMarca" runat="server">
        </asp:DataList>
    </form>
</body>
</html>
