<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewInfo.aspx.cs" Inherits="Addcar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Rental Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    <p>
        
        
        
        
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="chassis_no,trn" DataSourceID="SqlDataSource1" GridLines="Horizontal" Width="685px">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="chassis_no" HeaderText="chassis_no" ReadOnly="True" SortExpression="chassis_no" />
                <asp:BoundField DataField="trn" HeaderText="trn" ReadOnly="True" SortExpression="trn" />
                <asp:BoundField DataField="daterented" HeaderText="daterented" SortExpression="daterented" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="chassis_no,trn" DataSourceID="SqlDataSource2" Height="50px" Width="317px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="chassis_no" HeaderText="chassis_no" ReadOnly="True" SortExpression="chassis_no" />
                <asp:BoundField DataField="trn" HeaderText="trn" ReadOnly="True" SortExpression="trn" />
                <asp:BoundField DataField="daterented" HeaderText="daterented" SortExpression="daterented" />
                <asp:BoundField DataField="numDaysRented" HeaderText="numDaysRented" SortExpression="numDaysRented" />
                <asp:BoundField DataField="billTotal" HeaderText="billTotal" SortExpression="billTotal" />
                <asp:BoundField DataField="paymentmeth" HeaderText="paymentmeth" SortExpression="paymentmeth" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:1202773 %>" SelectCommand="SELECT * FROM [rents] WHERE ([chassis_no] = @chassis_no) ">
 <SelectParameters>
           <asp:ControlParameter Name="chassis_no" ControlID="GridView1" />
     
     
        </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1202773 %>" SelectCommand="SELECT [chassis_no], [trn], [daterented] FROM [Customer_Rental]"></asp:SqlDataSource>
    
    </p>
</asp:Content>

