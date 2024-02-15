using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        one my1 = new one();

        if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text))
        {
            Label1.Text = "Please enter both Email and Password";
        }
        else
        {
            my1.insertdata(TextBox1.Text, TextBox2.Text, Label1.Text);

            Response.Redirect("Home.aspx");
        }



        // one my1 = new one();

        // my1.insertdata(TextBox1.Text, TextBox2.Text, Label1.Text);
        // Label1.Text = "Email already registerd";
        // Response.Redirect("Home.aspx");
    }
}