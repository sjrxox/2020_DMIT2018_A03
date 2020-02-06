<%@ Page Title="Repeater Demo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RepeaterDemo.aspx.cs" Inherits="WebApp.SamplePages.RepeaterDemo" %>

<%@ Register Src="~/UserControl/MessageUserControl.ascx" TagPrefix="uc1" TagName="MessageUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Repeater for Nested Query</h1>
    <blockquote>This page will demostrate the repeater control. This control is a
        great web control to display the structure of a DTO/POCO Query. The control
        can be nested within itself to be used to display the POCO component of the 
        DTO structure. <br /> <br />
        To ease the working with the Properties in your lass on this control use
        the ItemType attribute and assign the class name of your data definition. The control
        uses a series of templates to fashion your display
    </blockquote>

    <div class="row text-center">
        <div class="col-md-12 text-center">
            Enter the size of playlist to view: &nbsp; &nbsp; 
            <asp:TextBox ID="NumberOfTracks" runat="server"></asp:TextBox>&nbsp;
            <asp:Button ID="Submit" runat="server" Text="Submit" />

        </div>
    </div>
    <div class="col-md-12 text-center">
        <asp:RequiredFieldValidator ID="RequiredNumberOfTracks" runat="server" ErrorMessage="Tracks size is required" Display="None" SetFocusOnError="true" ForeColor="Firebrick" ControlToValidate="NumberOfTracks"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareNumberOfTracks" runat="server" ErrorMessage="Tracks size must be a positive whole number" Display="None" SetFocusOnError="true" ForeColor="Firebrick" ControlToValidate="NumberOfTracks" Type="Integer" ValueToCompare="0" Operator="GreaterThan" ></asp:CompareValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <uc1:MessageUserControl runat="server" ID="MessageUserControl" />
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <asp:Repeater ID="ClientPlayListDTO" runat="server" DataSourceID="ClientPlayListDTOODS" ItemType="ChinookSystem.Data.DTOs.MyPlayList">
                <HeaderTemplate>
                    <h2>Client Playlists for Requested Size</h2>
                </HeaderTemplate>
                <ItemTemplate>
                    <h3>
                        <%# Item.Name %> Playtime: <%# Item.PlayTime %>
                    </h3>
<%--                    <asp:GridView ID="SongList" runat="server" DataSource="<%# Item.PlaylistSongs %>" ItemType="ChinookSystem.Data.POCOs.PlayListSong"></asp:GridView>--%>
                    <asp:Repeater ID="SongList" runat="server" DataSource="<%# Item.PlaylistSongs %>" ItemType="ChinookSystem.Data.POCOs.PlayListSong">
                        <ItemTemplate>
                            <%# Item.SongName %> &nbsp; &nbsp; <%# Item.Genre %> <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <asp:ObjectDataSource ID="ClientPlayListDTOODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Playlist_GotBySize" OnSelected="SelectedCheckForException" TypeName="ChinookSystem.BLL.PlaylistController">

        <SelectParameters>
            <asp:ControlParameter ControlID="NumberOfTracks" PropertyName="Text" Name="numberOfTracks" Type="Int32" DefaultValue="1"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
