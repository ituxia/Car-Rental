using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Reuasbles
/// </summary>
public class Reuasbles
{
    public static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["1202773"].ConnectionString;
    }
}