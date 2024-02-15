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

public partial class SellingList : System.Web.UI.Page
{
    UserBL2 bl = new UserBL2();
    UserBO2 bo = new UserBO2();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            drop1();
            drop2();
        }
        TextBox5.Text = DateTime.Now.ToString("dd/MMMM/yyyy");
    }
    
    SqlConnection cn;
    SqlCommand cm;
    SqlDataReader dr;
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        int retval = 0;
        bo.id = TextBox1.Text;
        bo.product = DropDownList1.Text;
        bo.maxcost = TextBox2.Text;
        bo.selcost = TextBox3.Text;
        bo.cstock = TextBox4.Text;
        bo.date = TextBox5.Text;
        retval = bl.saveuserdetail(bo);

        Session["selcost"] = TextBox3.Text;
    }
    protected void drop1()
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string b = "SELECT * from stockdb";
        cm = new SqlCommand(b, cn);

        dr = cm.ExecuteReader();
        
        DropDownList1.DataSource = dr;
        DropDownList1.DataTextField = "product";
        DropDownList1.DataBind();
        dr.Close();
    }
    protected void drop2()
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string c = "SELECT product from selldb where id=@id1";
        cm = new SqlCommand(c, cn);
        cm.Parameters.AddWithValue("id1", TextBox1.Text);

        dr = cm.ExecuteReader();
        
        DropDownList2.DataSource = dr;
        DropDownList2.DataTextField = "product";
        DropDownList2.DataBind();
        dr.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
    drop2();
    //string path = ConfigurationManager.AppSettings["mydb"];
    //cn = new SqlConnection(path);
    //cn.Open();

    //string k = "SELECT * FROM selldb";
    //cm = new SqlCommand(k, cn);
    //dr = cm.ExecuteReader();

    //GridView1.DataSource = dr;
    //GridView1.DataBind();

    //dr.Close();

    
        sellshow s1 = new sellshow();

        GridView1.DataSource = s1.showdata();

        GridView1.DataBind();
    }
    protected void bt1_click(object sender,EventArgs e)
    {
        GridViewRow r1 = ((Button)sender).NamingContainer as GridViewRow;
        TextBox t1 = (TextBox)r1.FindControl("TextBox9");
        TextBox t2 = (TextBox)r1.FindControl("TextBox6");

        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string k = "UPDATE selldb SET selcost=@selcost1 WHERE id=@id1";
        cm = new SqlCommand(k, cn);
        cm.Parameters.AddWithValue("selcost1", t1.Text);
        cm.Parameters.AddWithValue("id1",t2.Text);
        cm.ExecuteNonQuery();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string s = "SELECT id, product, maxcost, selcost, cstock, [date] FROM selldb WHERE product=@product1"; // Include id column in the SELECT query
        cm = new SqlCommand(s, cn);
        cm.Parameters.AddWithValue("product1", DropDownList2.Text);
        dr = cm.ExecuteReader();

        GridView1.DataKeyNames = new string[] { "id" }; // Specify the primary key column name

        GridView1.DataSource = dr;
        GridView1.DataBind();

        dr.Close();

        //string s = "SELECT product FROM selldb WHERE product=@product1";
        //cm = new SqlCommand(s, cn);
        //cm.Parameters.AddWithValue("product1", DropDownList2.Text);
        //dr = cm.ExecuteReader();

        //GridView1.DataSource = dr;

        //GridView1.DataBind();

        //dr.Close();
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string g = "select maxcost from selldb where product=@product1";
        cm = new SqlCommand(g, cn);

        cm.Parameters.AddWithValue("product1", DropDownList1.Text);

        dr = cm.ExecuteReader();

        if (dr.Read())
        {
            TextBox2.Text = dr["maxcost"].ToString();

        }
    }
}