using System;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.Collections.Generic;
using System.Web.Configuration;

[DataObject(true)]
public static class CarDb
{
    [DataObjectMethod(DataObjectMethodType.Select)]

    public static List<Car> GetCar()
    {
        List<Car> CarList = new List<Car>();

        SqlDataReader dr = null;
        const string storedProcedureName = "sp_GetCars";

        using (SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString()))
        {
            SqlCommand command = new SqlCommand(storedProcedureName, connection);
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                connection.Open();
                dr = command.ExecuteReader();

                Car car;

                while (dr.Read())
                {
                    car = new Car();

                    car.chas = dr["chassi_no"].ToString();
                    car.colour = dr["colour"].ToString();
                    car.carmake = dr["carmake"].ToString();
                  


                    CarList.Add(car);
                }
                dr.Close();


                command.Cancel();
            }
            catch (Exception err)
            {
                err.Data["Procedure"] = "Getting list of Cars";
                err.Data["sp"] = storedProcedureName;
            }
            finally
            {
                connection.Close();
            }
        }

        return CarList;
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static int InsertAccount(Car car)
    {
        SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString());
        SqlCommand command = new SqlCommand("sp_InsertCars", connection);
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add(new SqlParameter("chas", car.chas));
        command.Parameters.Add(new SqlParameter("col", car.colour));
        command.Parameters.Add(new SqlParameter("carmake", car.carmake));
     


        connection.Open();
        int insertCommand = command.ExecuteNonQuery();
        connection.Close();

        return insertCommand;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int updateAccount(Car car)
    {
        SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString());
        SqlCommand command = new SqlCommand("sp_UpdateCars", connection);
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add(new SqlParameter("chas", car.chas));
        command.Parameters.Add(new SqlParameter("col", car.colour));
        command.Parameters.Add(new SqlParameter("carmake", car.carmake));

        connection.Open();
        int updateCommand = command.ExecuteNonQuery();
        connection.Close();

        return updateCommand;
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteCar(Car car)
    {
        SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString());

        SqlCommand command = new SqlCommand("sp_DeleteCars", connection);
        command.CommandType = CommandType.StoredProcedure;
 

        //command.Parameters.Add("@chas", SqlDbType.VarChar).Value = car.chas;

        connection.Open();
        int i = command.ExecuteNonQuery();
        connection.Close();

        return i;
    }

    //[DataObjectMethod(DataObjectMethodType.Delete)]
    //public static int deleteCar(Car car)
    //{
    //    SqlConnection connection = new SqlConnection(Reuasbles.GetConnectionString());
    //    SqlCommand command = new SqlCommand("sp_DeleteCars", connection);
    //    command.CommandType = CommandType.StoredProcedure;

    //    command.Parameters.Add(new SqlParameter("chas", car.carmake));
       
    //    connection.Open();
    //    int i = command.ExecuteNonQuery();
    //    connection.Close();

    //    return i;
    //}
}