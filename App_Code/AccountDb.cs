using System;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.Collections.Generic;
using System.Web.Configuration;

[DataObject(true)]
public static class AccountDb
{
    [DataObjectMethod(DataObjectMethodType.Select)]

    public static List<Account> GetAccount()
    {
        List<Account> AccountList = new List<Account>();

        SqlDataReader dr = null;
        const string storedProcedureName = "GetAccount";

        using (SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString()))
        {
            SqlCommand command = new SqlCommand(storedProcedureName, connection);
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                connection.Open();
                dr = command.ExecuteReader();

                Account acct;

                while (dr.Read())
                {
                    acct = new Account();

                    //acct.id = (int)dr["id"];
                    //acct.balance = (int)dr["balance"];
                    //acct.trn = (int)dr["trn"];
                    //acct.acc_type = dr["acc_type"].ToString();
                    ////acct.date_created = dr["mname"].ToString();
                  

                    AccountList.Add(acct);
                }
                dr.Close();


                command.Cancel();
            }
            catch (Exception err)
            {
                err.Data["Procedure"] = "Getting list of Clients";
                err.Data["sp"] = storedProcedureName;
            }
            finally
            {
                connection.Close();
            }
        }

        return AccountList;
    }
   


    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int updateAccount(Account acct)
    {
        SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString());
        SqlCommand command = new SqlCommand("updateClient", connection);
        command.CommandType = CommandType.StoredProcedure;

        //command.Parameters.Add(new SqlParameter("@trn", acct.id));
        //command.Parameters.Add(new SqlParameter("@mobile", acct.balance));
        //command.Parameters.Add(new SqlParameter("@fname", acct.trn));
        //command.Parameters.Add(new SqlParameter("@lname", acct.acc_type));

        connection.Open();
        int updateCommand = command.ExecuteNonQuery();
        connection.Close();

        return updateCommand;
    }


    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int deleteClient(Account acct)
    {
        SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString());
        SqlCommand command = new SqlCommand("deleteClient", connection);
        command.CommandType = CommandType.StoredProcedure;

        //command.Parameters.Add(new SqlParameter("id", acct.id));
        //command.Parameters.Add(new SqlParameter("mobile", acct.mobile));
        //command.Parameters.Add(new SqlParameter("fname", acct.fname));
        //command.Parameters.Add(new SqlParameter("lname", acct.lname));
        //command.Parameters.Add(new SqlParameter("mname", acct.mname));
        //command.Parameters.Add(new SqlParameter("dob", client.streetName));


        connection.Open();
        int i = command.ExecuteNonQuery();
        connection.Close();

        return i;
    }
}