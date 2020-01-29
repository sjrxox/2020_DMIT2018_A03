<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AlbumsWithArtist.aspx.cs" Inherits="WebApp.SamplePages.AlbumsWithArtist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Albums With Artist</h1>
    <blockquote>
        This page is proof of Linq query development using LinqPad for query development
        Testing of the query and POCO class has been completed within LinqPad. Code has been
        transfered to the application AFTER successful testing in LinqPad.
    </blockquote>

    <br /><br />

    <asp:GridView ID="AlbumsWithArtistList" runat="server"></asp:GridView>
    <%--AllowPagin = true PageSize = 15, GridLine = Horizontal, BorderStyle = None, CssClass = table table-striped--%>

    <asp:ObjectDataSource ID="AlbumsWithArtistListODS" runat="server"></asp:ObjectDataSource>
</asp:Content>
