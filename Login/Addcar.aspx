<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Addcar.aspx.cs" Inherits="Addcar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
   Car Details 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server"><link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FAFAD2; color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="chasLabel" runat="server" Text='<%# Eval("chas") %>' />
                </td>
                <td>
                    <asp:Label ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                </td>
                <td>
                    <asp:Label ID="carmakeLabel" runat="server" Text='<%# Eval("carmake") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #FFCC66; color: #000080;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="chasTextBox" runat="server" Text='<%# Bind("chas") %>' />
                </td>
                <td>
                    <asp:TextBox ID="colourTextBox" runat="server" Text='<%# Bind("colour") %>' />
                </td>
                <td>
                    <asp:TextBox ID="carmakeTextBox" runat="server" Text='<%# Bind("carmake") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="chasTextBox" runat="server" Text='<%# Bind("chas") %>' />
                </td>
                <td>
                    <asp:TextBox ID="colourTextBox" runat="server" Text='<%# Bind("colour") %>' />
                </td>
                <td>
                    <asp:TextBox ID="carmakeTextBox" runat="server" Text='<%# Bind("carmake") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFBD6; color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="chasLabel" runat="server" Text='<%# Eval("chas") %>' />
                </td>
                <td>
                    <asp:Label ID="colourLabel" runat="server" Text='<%# Eval("colour") %>' />
                </td>
                <td>
                    <asp:Label ID="carmakeLabel" runat="server" Text='<%# Eval("carmake") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">Chasis Information</th>
                                <th runat="server">Colour</th>
                                <th runat="server">Car Make</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;"></td>
                </tr>
            </table>
        </LayoutTemplate>
</asp:ListView>


    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="Car" DeleteMethod="DeleteCar" InsertMethod="InsertAccount" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCar" TypeName="CarDb" UpdateMethod="updateAccount"></asp:ObjectDataSource>


    </asp:Content>

