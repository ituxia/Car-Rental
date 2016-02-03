using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.Collections.Generic;
using System.Web.Configuration;

public partial class Confirm : System.Web.UI.Page
{
    private Account account;
    protected void Page_Load(object sender, EventArgs e)
    {
        account = (Account)Session["Account"];
        this.DisplayInfo();

    }
    private void DisplayInfo()
    {



        if (account.newsletter)
            lblnews.Text = "Yes";
        else
            lblnews.Text = "No";

        lblTrn.Text = Convert.ToString(account.trn);
       
        lblcarname.Text = account.carName.ToString();
        lblFirstName.Text = account.firstName;
        lblLastName.Text = account.lastName;
        lblnumdays.Text = Convert.ToString(account.daysNUmber);
        lblpayment.Text = account.paymentMethod;

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session["account"] = null;

        Response.Redirect("Sales.aspx");
    }

    protected void SendTODb(object sender, EventArgs e)
    {
        DateTime dateTime = DateTime.UtcNow.Date;
          
  SqlConnection  connection = new SqlConnection(Reuasbles.GetConnectionString());
  SqlCommand command = new SqlCommand("sp_InsertRecord", connection);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add(new SqlParameter("trn", lblTrn.Text));
        command.Parameters.Add(new SqlParameter("fn", lblFirstName.Text));
        command.Parameters.Add(new SqlParameter("ln", lblLastName.Text));
        command.Parameters.Add(new SqlParameter("news", lblnews.Text));
        command.Parameters.Add(new SqlParameter("chas", account.chasisNO));
        command.Parameters.Add(new SqlParameter("date", dateTime.ToString("dd/MM/yyyy")));
        command.Parameters.Add(new SqlParameter("num", lblnumdays.Text));
        command.Parameters.Add(new SqlParameter("bill", account.calculatebill(account.daysNUmber)));
        command.Parameters.Add(new SqlParameter("payment", lblpayment.Text));

     
        connection.Open();
        int insertCommand = command.ExecuteNonQuery();
        connection.Close();
        Response.Redirect("ViewInfo.aspx");

    }

    }

