<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Display.aspx.cs" Inherits="Confirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Confirm
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
  <div>
 
           <h3>Your Car Rental Selection</h3>
          <h4 class="text">Trn:</h4>
    <h5 class="label"><asp:Label ID="lblTrn" runat="server"></asp:Label></h5>                
    <h4 class="text">First Name:</h4>
    <h5 class="label"><asp:Label ID="lblFirstName" runat="server"></asp:Label></h5>
    <h4 class="text">Last Name:</h4>
    <h5 class="label"><asp:Label ID="lblLastName" runat="server"></asp:Label></h5>
    <h4 class="text">Car Name:</h4>
    <h5 class="label"><asp:Label ID="lblcarname" runat="server"></asp:Label></h5>
    <h4 class="text">Number of Days:</h4>
    <h5 class="label"><asp:Label ID="lblnumdays" runat="server"></asp:Label></h5>
  
    <h4 class="text">Payment method:</h4>
    <h5 class="label"><asp:Label ID="lblpayment" runat="server"></asp:Label></h5>
    <h4 class="text">Sign up for Newsletter type:</h4>
    <h5 class="label"><asp:Label ID="lblnews" runat="server"></asp:Label></h5>
   

         &nbsp;&nbsp;
        <p id="buttons">
       <asp:Button ID="btnSubmit" runat="server" Text="Confim Information" Width="200px" onclick="SendTODb" CssClass="btn btn-success btn-lg" />&nbsp;
        <asp:Button ID="btnClear" runat="server" Text="Cancel" Width="90px"  onclick="btnCancel_Click" CssClass="btn btn-danger btn-lg"  />
            </p>
  
    </div>
</asp:Content>

