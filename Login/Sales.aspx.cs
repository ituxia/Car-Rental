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

public partial class Sales : System.Web.UI.Page
{
    private Account account = new Account();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Populate1();

        }
    }

    public void Populate1()
    {
        SqlDataReader dr = null;
        const string storedProcedureName = "sp_GetCars";

        using (SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString()))
        {
            SqlCommand command = new SqlCommand(storedProcedureName, connection);
            command.CommandType = CommandType.StoredProcedure;

            command.Connection.Open();

            SqlDataReader ddlValues;
            ddlValues = command.ExecuteReader();

            ddlcar.DataSource = ddlValues;
            ddlcar.DataValueField = "chassi_no";
            ddlcar.DataTextField = "carmake";
            ddlcar.DataBind();

            command.Connection.Close();
            command.Connection.Dispose();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        trnbox.Text = "";
        firstname.Text = "";
        lastname.Text = "";
        ddlcar.SelectedIndex = -1;
        txtdays.Text = "";


        cash.Checked = true;



        newsletter.Checked = false;


    }


    private void DisplayInfo()
    {


        trnbox.Text = account.trn.ToString();
        txtdays.Text = account.daysNUmber.ToString();

        ddlcar.SelectedValue = account.carName.ToString();



        if (account.paymentMethod == "Cash")
            cash.Checked = true;
        else if (account.paymentMethod == "Credit Card")
            crdcard.Checked = true;
        else
            debitcard.Checked = true;



        newsletter.Checked = account.newsletter;



        firstname.Text = account.firstName;
        lastname.Text = account.lastName;
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {account.trn=Convert.ToInt32(trnbox.Text);
        account.firstName = firstname.Text;
        account.lastName = lastname.Text;
        account.carName = Convert.ToString(ddlcar.SelectedItem.Text);
        account.chasisNO = Convert.ToString(ddlcar.SelectedValue);
        account.daysNUmber = Convert.ToInt32(txtdays.Text);
       

        if (cash.Checked)
            account.paymentMethod = "Cash";
        else if (crdcard.Checked)
            account.paymentMethod = "Credit Card";
        else
            account.paymentMethod = "Debit Card";



        account.newsletter = newsletter.Checked;




        Session["Account"] = account;

        Response.Redirect("Display.aspx");
    }
}