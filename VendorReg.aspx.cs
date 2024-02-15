using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObject;
using BusinessLogic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class VendorReg : System.Web.UI.Page
{
    UserBL bl = new UserBL();
    UserBO bo = new UserBO();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    SqlConnection cn;
    SqlCommand cm;
    SqlDataReader dr;
    protected void Button1_Click(object sender, EventArgs e)
    {
        UserBO bo = new UserBO();

        
        bo.id = TextBox1.Text;
        bo.name = TextBox2.Text;
        bo.city = DropDownList1.Text;
        bo.address = TextBox3.Text;
        bo.mobile = TextBox4.Text;

       
        UserBL bl = new UserBL();

        
        int retval = bl.saveuserdetail(bo);

       
        if (retval > 0)
        {
            Label1.Text = "User details saved successfully.";
        }
        else if (retval == -1)
        {
            Label1.Text = "Error: Duplicate user ID detected.";
        }
        else
        {
            Label1.Text = "Error: Unable to save user details.";
        }

            // int retval = 0;
            // bo.id = TextBox1.Text;
            // bo.name = TextBox2.Text;
            // bo.city = DropDownList1.Text;
            // bo.address = TextBox3.Text;
            // bo.mobile = TextBox4.Text;
            // retval = bl.saveuserdetail(bo);
        }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        //cm = new SqlCommand("showvendor", cn);
        //cm.CommandType = CommandType.StoredProcedure;
        //string k = "SELECT * FROM vendordb";
        //cm = new SqlCommand(k, cn);
        //dr = cm.ExecuteReader();

        //GridView1.DataSource = dr;
        //GridView1.DataBind();

        //dr.Close();

        vendorshow v1 = new vendorshow();

        GridView1.DataSource = v1.showdata();

        GridView1.DataBind();

    }
    protected void bt1_click(object sender,EventArgs e)
    {
        //int retval = 0;

        GridViewRow r1 = ((Button)sender).NamingContainer as GridViewRow;
        TextBox t1 = (TextBox)r1.FindControl("TextBox6");
        TextBox t2 = (TextBox)r1.FindControl("TextBox7");
        TextBox t3 = (TextBox)r1.FindControl("TextBox8");
        TextBox t4 = (TextBox)r1.FindControl("TextBox9");
        TextBox t5 = (TextBox)r1.FindControl("TextBox10");
        DropDownList d1 = (DropDownList)r1.FindControl("DropDownList2");

        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string k = "UPDATE vendordb SET name=@name1,city=@city1,address=@address1,mobile=@mobile1,status=@status1 WHERE id=@id1";
        cm = new SqlCommand(k, cn);
        cm.Parameters.AddWithValue("id1", t1.Text);
        cm.Parameters.AddWithValue("name1", t2.Text);
        cm.Parameters.AddWithValue("city1", t3.Text);
        cm.Parameters.AddWithValue("address1", t4.Text);
        cm.Parameters.AddWithValue("mobile1", t5.Text);
        cm.Parameters.AddWithValue("status1", d1.Text);
        cm.ExecuteNonQuery();

        //bo.id = t1.Text;
        //bo.name = t2.Text;
        //bo.city = t3.Text;
        //bo.address = t4.Text;
        //bo.mobile = t5.Text;
        //bo.status = d1.Text;
        //retval = bl.saveuserdetail(bo);
    }
    protected void bt2_click(object sender, EventArgs e)
    {
        GridViewRow r1 = ((Button)sender).NamingContainer as GridViewRow;
        TextBox t1 = (TextBox)r1.FindControl("TextBox6");

        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string k = "DELETE FROM vendordb WHERE id=@id1";
        cm = new SqlCommand(k, cn);
        cm.Parameters.AddWithValue("id1", t1.Text);
        cm.ExecuteNonQuery();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string b = "SELECT * from vendordb where mobile=@mobile1";
        cm = new SqlCommand(b, cn);

        cm.Parameters.AddWithValue("mobile1", TextBox5.Text);
        dr = cm.ExecuteReader();
        //bind data to grid view
        GridView1.DataSource = dr;
        GridView1.DataBind();

        dr.Close();

    }
}