<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VictoriaWeb.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoMenuContextual" runat="server">
    <asp:DataList ID="dlListado" runat="server" RepeatColumns="3" Height="619px" style="margin-left: 6px; margin-top: 4px" Width="898px"  >
        <ItemTemplate>
            <div class="thumbnail">
                <asp:Image ImageUrl='<%#"~/ImageHandler.ashx?id=" + Eval("Id")%>' runat="server" Height="200px" Width="200px"/>
                <div class="caption">
                    <h3><%#Eval("Nombre") %></h3>
                    <p><%#Eval("Precio") %></p>
                    <p>
                        <a href="#" class="btn btn-success">Detalles</a>
                    </p>
                </div>
            </div>
            
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
    
</asp:Content>
