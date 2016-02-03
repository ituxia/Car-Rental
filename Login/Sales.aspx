<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server"> Rent a Car
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server"><link href="Content/bootstrap.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="content" Runat="Server">
 
 
<%--  <button type="submit" class="btn btn-default">Sign in</button>--%>

      <div >
        &nbsp;&nbsp;

  <p><asp:TextBox ID="trnbox" runat="server" Width="320px" placeholder="Trn" CssClass="form-control input-lg"> </asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*This Field is Required" ControlToValidate="trnbox"></asp:RequiredFieldValidator>

  </p> <br/>
        <p> <asp:TextBox ID="firstname" runat="server" Width="320px" placeholder="First Name" CssClass="form-control input-lg"> </asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*This Field is Required" ControlToValidate="firstname"></asp:RequiredFieldValidator>
        
        <asp:TextBox ID="lastname" runat="server" Width="320px"  placeholder="Last Name" CssClass="form-control input-lg"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*This Field is Required" ControlToValidate="lastname"></asp:RequiredFieldValidator>
        </p>

       

    <h4> Type of car:&nbsp;
        <asp:DropDownList ID="ddlcar" runat="server" Width="130px" 
            ViewStateMode="Enabled" CssClass="form-control input-lg">
        </asp:DropDownList>&nbsp;&nbsp;</h4>

         <br />
      <h4>  Number of days:&nbsp;      
         
        <asp:TextBox ID="txtdays" runat="server" Width="60px" CssClass="form-control input-lg"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*This Field is Required" ControlToValidate="txtdays"></asp:RequiredFieldValidator>

          </h4>
     
       <h4> 
       Payment Method:&nbsp;
             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="paymenttyp"></asp:RequiredFieldValidator>--%>

        <asp:RadioButton ID="cash" runat="server" Text="Cash" 
            GroupName="paymenttyp" />&nbsp;
        <asp:RadioButton ID="crdcard" runat="server" Text="Credit Card" 
            GroupName="paymenttyp" />
        <asp:RadioButton ID="debitcard" runat="server" Text="Debit Card" 
            GroupName="paymenttyp" />
    </h4>&nbsp;&nbsp;

        <h4> 
        <asp:CheckBox ID="newsletter" runat="server" Text="Sign up for newsletter" />
    </h4> 
          &nbsp;&nbsp;
        <p id="buttons">
       <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="90px" onclick="btnSubmit_Click" CssClass="btn btn-success btn-lg" />&nbsp;
        <asp:Button ID="btnClear" runat="server" Text="Clear" Width="90px"  onclick="btnClear_Click" CssClass="btn btn-default btn-lg"  />
            </p>
    </div>
</asp:Content>


