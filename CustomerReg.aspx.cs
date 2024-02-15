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

public partial class CustomerReg : System.Web.UI.Page
{
    UserBL3 bl = new UserBL3();
    UserBO3 bo = new UserBO3();
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox7.Text = DateTime.Now.ToString("dd/MMMM/yyyy");
        
    }
    SqlConnection cn;
    SqlCommand cm;
    SqlDataReader dr;
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["name"] = TextBox2.Text;
        Session["email"] = TextBox3.Text;
        Session["mobile"] = TextBox4.Text;

        int retval = 0;
        bo.id = TextBox1.Text;
        bo.name = TextBox2.Text;
        bo.email = TextBox3.Text;
        bo.mobile = TextBox4.Text;
        bo.city = TextBox5.Text;
        bo.address = TextBox6.Text;
        bo.date = TextBox7.Text;
        retval = bl.saveuserdetail(bo);

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string k = "SELECT * FROM cust_reg";
        cm = new SqlCommand(k, cn);
        dr = cm.ExecuteReader();

        GridView1.DataSource = dr;
        GridView1.DataBind();

        dr.Close();
    }
    protected void bt1_click(object sender,EventArgs e)
    {
        GridViewRow r1 = ((Button)sender).NamingContainer as GridViewRow;
        TextBox t1 = (TextBox)r1.FindControl("TextBox8");
        TextBox t2 = (TextBox)r1.FindControl("TextBox9");
        TextBox t3 = (TextBox)r1.FindControl("TextBox10");
        TextBox t4 = (TextBox)r1.FindControl("TextBox11");
        TextBox t5 = (TextBox)r1.FindControl("TextBox12");
        

        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string k = "UPDATE cust_reg SET name=@name1,email=@email1,mobile=@mobile1,city=@city1 WHERE id=@id1";
        cm = new SqlCommand(k, cn);
        cm.Parameters.AddWithValue("id1", t1.Text);
        cm.Parameters.AddWithValue("name1", t2.Text);
        cm.Parameters.AddWithValue("email1", t3.Text);
        cm.Parameters.AddWithValue("mobile1", t4.Text);
        cm.Parameters.AddWithValue("city1", t5.Text);
        
        cm.ExecuteNonQuery();

        TextBox2.Text = r1.Cells[1].Text;
        TextBox3.Text = r1.Cells[2].Text;
        TextBox4.Text = r1.Cells[3].Text;
        TextBox5.Text = r1.Cells[4].Text;
    }
    protected void bt2_click(object sender,EventArgs e)
    {
        GridViewRow r1 = ((Button)sender).NamingContainer as GridViewRow;
        TextBox t1 = (TextBox)r1.FindControl("TextBox8");

        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string k = "DELETE FROM cust_reg WHERE id='"+r1.Cells[0].Text+"'";
        cm = new SqlCommand(k, cn);
        cm.ExecuteNonQuery();
    }
    protected void bt3_click(object sender,EventArgs e)
    {
        Response.Redirect("DC.aspx");
    }
}