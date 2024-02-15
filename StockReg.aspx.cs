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

public partial class StockReg : System.Web.UI.Page
{
    UserBL1 bl = new UserBL1();
    UserBO1 bo = new UserBO1();
    UserBL5 bl1 = new UserBL5();
    UserBO5 bo1 = new UserBO5();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            PopulateDropDownList();
        }
    }
    SqlConnection cn;
    SqlCommand cm;
    SqlDataReader dr;
    protected void Button2_Click(object sender, EventArgs e)
    {
        int retval = 0;

        int id1, cost1, qty1, total1, scount1;

        id1 = int.Parse(TextBox1.Text);
        cost1 = int.Parse(TextBox3.Text);
        qty1 = int.Parse(TextBox4.Text);
        total1 = int.Parse(TextBox5.Text);
        scount1 = int.Parse(TextBox6.Text);

        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string k = "SELECT name FROM vendordb where id='" + TextBox1.Text + "'";
        cm = new SqlCommand(k, cn);
        dr = cm.ExecuteReader();

        bo.id = TextBox1.Text;
        bo.name = DropDownList1.Text;
        bo.mobile = TextBox2.Text;
        bo.product = DropDownList2.Text;
        bo.cost = TextBox3.Text;
        bo.quantity = TextBox4.Text;
        bo.total = TextBox5.Text;
        bo.count = TextBox6.Text;
        bo.status = "OPEN";

        if (scount1 == 0)
        {
            bo.status = "CLOSE";
        }

        retval = bl.saveuserdetail(bo);

        // Insert into stock_summary


        bo1.id = TextBox1.Text;
        bo1.product = DropDownList2.Text;
        bo1.stock = TextBox6.Text;
        bo1.totalstock = TextBox5.Text;

        retval = bl1.saveuserdetail(bo1);

        Session["stock"] = TextBox6.Text;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        //cm = new SqlCommand("showstock", cn);
        //cm.CommandType = CommandType.StoredProcedure;
        //dr = cm.ExecuteReader();

        //GridView1.DataSource = dr;
        //GridView1.DataBind();
        //GridView1.FooterRow.Cells[1].Text = "total";

        //dr.Close();

        stockshow s1 = new stockshow();

        GridView1.DataSource = s1.showdata();
        GridView1.DataBind();
        GridView1.FooterRow.Cells[1].Text = "total";


        string i = "SELECT SUM(totalstock) from stock_summery";
        cm = new SqlCommand(i, cn);

        GridView1.FooterRow.Cells[3].Text = cm.ExecuteScalar().ToString();


        string o = "SELECT SUM(stock) from stock_summery";
        cm = new SqlCommand(o, cn);

        GridView1.FooterRow.Cells[2].Text = cm.ExecuteScalar().ToString();
    }
    protected void bt1_click(object sender, EventArgs e)
    {
        // View History

        GridViewRow r1 = ((Button)sender).NamingContainer as GridViewRow;

        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string a = "SELECT id,vendor,cost,qty,total FROM stockdb WHERE product=@product1";
        cm = new SqlCommand(a, cn);
        cm.Parameters.AddWithValue("product1", DropDownList2.Text);

        dr = cm.ExecuteReader();
        GridView2.DataSource = dr;
        GridView2.DataBind();
        GridView2.FooterRow.Cells[1].Text = "total";
        dr.Close();

        string b = "SELECT SUM(cost) FROM stockdb WHERE product=@product1";
        cm = new SqlCommand(b, cn);
        cm.Parameters.AddWithValue("product1", DropDownList2.Text);
        GridView2.FooterRow.Cells[2].Text = cm.ExecuteScalar().ToString();

        string c = "SELECT SUM(qty) FROM stockdb WHERE product=@product1";
        cm = new SqlCommand(c, cn);
        cm.Parameters.AddWithValue("product1", DropDownList2.Text);
        GridView2.FooterRow.Cells[3].Text = cm.ExecuteScalar().ToString();

        string d = "SELECT SUM(total) FROM stockdb WHERE product=@product1";
        cm = new SqlCommand(d, cn);
        cm.Parameters.AddWithValue("product1", DropDownList2.Text);
        GridView2.FooterRow.Cells[4].Text = cm.ExecuteScalar().ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int total1, cost1, quantity1;

        cost1 = int.Parse(TextBox3.Text);
        bo.cost = cost1.ToString();

        quantity1 = int.Parse(TextBox4.Text);
        bo.quantity = quantity1.ToString();

        total1 = cost1 * quantity1;

        TextBox5.Text = total1.ToString();

        //int idno, salep, Qty, Total;

        //idno = int.Parse(TextBox1.Text);
        //bo.id = idno.ToString();

        //salep = int.Parse(TextBox3.Text);
        //bo.cost = salep.ToString();

        //Qty = int.Parse(TextBox4.Text);
        //bo.quantity = Qty.ToString();

        //Total = salep * Qty;

        //TextBox5.Text = Total.ToString();

    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedValue == "Add New Product")
        {
            TextBox17.Visible = true;
            Button6.Visible = true;
        }
        else
        {
            TextBox17.Visible = false;
            Button6.Visible = false;
        }
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        DropDownList2.Items.Insert(1, TextBox17.Text);

        bo.product = TextBox17.Text;
    }


    protected void PopulateDropDownList()
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string k = "SELECT name FROM vendordb WHERE status='Unblock'";


        using (SqlCommand cm = new SqlCommand(k, cn))
        {
            using (SqlDataReader dr = cm.ExecuteReader())
            {
                DropDownList1.Items.Clear(); // Clear existing items
                while (dr.Read())
                {
                    ListItem item = new ListItem(dr["name"].ToString());
                    DropDownList1.Items.Add(item);
                }
            }
        }
    }
    


    //string k = "SELECT name FROM vendordb WHERE status='Unblock'";
    //cm = new SqlCommand(k, cn);
    //dr = cm.ExecuteReader();

    //DropDownList1.DataSource = dr;
    //DropDownList1.DataTextField = "name";
    //DropDownList1.DataBind();

    //dr.Close();
}

