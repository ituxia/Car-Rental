using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Account
{
    public Account() { }
    public int trn { get; set; }
    public String firstName { get; set; }
    public String lastName { get; set; }
    public String carName { get; set; }
    public int daysNUmber { get; set; }
    public String paymentMethod { get; set; }
    public bool newsletter { get; set; }
    public String chasisNO { get; set; }
    public int calculatebill(int day)
    {

        return day*3000;
    }

}