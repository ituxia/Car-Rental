<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server"> Customer Information
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="trn" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Width="1034px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="trn" HeaderText="Trn" ReadOnly="True" SortExpression="trn" />
            <asp:BoundField DataField="l_name" HeaderText="Last Name" SortExpression="l_name" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1202773 %>" SelectCommand="SELECT [trn], [l_name] FROM [customer]"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="trn" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <EditItemTemplate>
            Trn
            <asp:Label ID="trnLabel1" runat="server" Text='<%# Eval("trn") %>' />
            <br />
            First Name
            <asp:TextBox ID="f_nameTextBox" runat="server" Text='<%# Bind("f_name") %>' />
            <br />
            Last Name
            <asp:TextBox ID="l_nameTextBox" runat="server" Text='<%# Bind("l_name") %>' />
            <br />
            &nbsp;<br />&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" BackColor="White" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" BackColor="Black" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="Black" />
        <FooterStyle BackColor="Black" ForeColor="#333333" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="Black" />
        <InsertItemTemplate>
            trn:
            <asp:TextBox ID="trnTextBox" runat="server" Text='<%# Bind("trn") %>' />
            <br />
            f_name:
            <asp:TextBox ID="f_nameTextBox" runat="server" Text='<%# Bind("f_name") %>' />
            <br />
            l_name:
            <asp:TextBox ID="l_nameTextBox" runat="server" Text='<%# Bind("l_name") %>' />
            <br />
            newsletter:
            <asp:TextBox ID="newsletterTextBox" runat="server" Text='<%# Bind("newsletter") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Trn:
            <asp:Label ID="trnLabel" runat="server" Text='<%# Eval("trn") %>' />
            <br />
            First Name:
            <asp:Label ID="f_nameLabel" runat="server" Text='<%# Bind("f_name") %>' />
            <br />
            Last Name:
            <asp:Label ID="l_nameLabel" runat="server" Text='<%# Bind("l_name") %>' />
            <br />
            Newsletter:
            <asp:Label ID="newsletterLabel" runat="server" Text='<%# Bind("newsletter") %>' />
            <br />
            <asp:Button runat="server" id="edit_button" CommandName="Edit" Text="Edit" />
        </ItemTemplate>
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle ForeColor="#333333" BackColor="White" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:1202773 %>" SelectCommand="SELECT * FROM [customer] WHERE ([trn] = @trn)" UpdateCommand="Update [customer] set f_name =@f_name , l_name =@l_name WHERE ([trn] = @trn)">
        <SelectParameters>
           <asp:ControlParameter Name="trn" ControlID="GridView1" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="f_name" />
            <asp:Parameter Name="l_name" />
            <asp:Parameter Name="trn" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

