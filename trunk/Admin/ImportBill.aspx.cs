﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ImportBill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            FillData();
        }
    }
    private void FillData()
    {
        gridImportBill.DataSource = ImportBill.GetAll();
        gridImportBill.DataBind();
    }    
}
