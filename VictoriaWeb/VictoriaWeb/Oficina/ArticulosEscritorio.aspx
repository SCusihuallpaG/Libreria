<%@ Page Title="" Language="C#" MasterPageFile="~/Oficina/MPOficina.master" AutoEventWireup="true" CodeBehind="ArticulosEscritorio.aspx.cs" Inherits="VictoriaWeb.Oficina.ArticulosEscritorio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPrincipal" runat="server">
    
    <%--<asp:DataList ID="dllistado" runat="server"
        RepeatColumns="2" >
        <ItemTemplate>
            <div >
                
                <asp:Image class="" ImageUrl='<%#"~/ImageHandler.ashx?id="+Eval("id")%>' runat="server" />
                <div >
                    <h3><%#Eval("Nombre")%></h3>
                    <p><%#Eval("Precio")%></p>
                                   
                </div>
            </div>
            
        </ItemTemplate>
    </asp:DataList>--%>
</asp:Content>
