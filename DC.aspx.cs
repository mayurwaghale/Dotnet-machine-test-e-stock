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

public partial class DC : System.Web.UI.Page
{
    UserBL4 bl = new UserBL4();
    UserBO4 bo = new UserBO4();
    protected void Page_Load(object sender, EventArgs e)
    {
        stocksummaryupdate();
        TextBox9.Text = DateTime.Now.ToString("dd/MMMM/yyyy");

        TextBox1.Text = (string)Session["name"];
        TextBox2.Text = (string)Session["email"];
        TextBox3.Text = (string)Session["mobile"];
        TextBox5.Text = (string)Session["selcost"];
        TextBox6.Text = (string)Session["stock"];
    }
    SqlCommand cm;
    SqlConnection cn;
    SqlDataReader dr;
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            int idno, salep, Qty, Total;

            // Parsing ID number
            if (!int.TryParse(TextBox4.Text, out idno))
                throw new ArgumentException("Invalid ID number");

            // Parsing sale price
            if (!int.TryParse(TextBox5.Text, out salep))
                throw new ArgumentException("Invalid sale price");

            // Parsing quantity
            if (!int.TryParse(TextBox7.Text, out Qty))
                throw new ArgumentException("Invalid quantity");

            
            bo.dcid = idno.ToString();
            bo.price = salep.ToString();
            bo.qty = Qty.ToString();

            // Calculating total
            Total = salep * Qty;

            // Displaying total
            TextBox8.Text = Total.ToString();
        }
        catch (ArgumentException ex)
        {
            TextBox8.Text = "Error: " + ex.Message;
        }
        catch (Exception ex)
        {
            TextBox8.Text = "An unexpected error occurred.";
        }

        //int idno, salep, Qty, Total;

        //idno = int.Parse(TextBox4.Text);
        //bo.dcid = idno.ToString();

        //salep = int.Parse(TextBox5.Text);
        //bo.price = salep.ToString();

        //Qty = int.Parse(TextBox7.Text);
        //bo.qty = Qty.ToString();

        //Total = salep * Qty;

        //TextBox8.Text = Total.ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["dcid"] = TextBox4.Text;
        Session["name"] = TextBox1.Text;
        Session["mobile"] = TextBox3.Text;

        int retval = 0;
        bo.name = TextBox1.Text;
        bo.email = TextBox2.Text;
        bo.mobile = TextBox3.Text;
        bo.dcid = TextBox4.Text;
        bo.product = DropDownList1.Text;
        bo.price = TextBox5.Text;
        bo.stock = TextBox6.Text;
        bo.qty = TextBox7.Text;
        bo.total = TextBox8.Text;
        bo.date = TextBox9.Text;
        retval = bl.saveuserdetail(bo);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        //cm = new SqlCommand("showvendor", cn);
        //cm.CommandType = CommandType.StoredProcedure;
        string k = "SELECT * FROM dcdb";
        cm = new SqlCommand(k, cn);
        dr = cm.ExecuteReader();

        GridView1.DataSource = dr;
        GridView1.DataBind();

        dr.Close();
        GridView1.FooterRow.Cells[1].Text = "total";

        string i = "SELECT SUM(sale) from dcdb";
        cm = new SqlCommand(i, cn);

        GridView1.FooterRow.Cells[2].Text = cm.ExecuteScalar().ToString();


        string o = "SELECT SUM(qty) from dcdb";
        cm = new SqlCommand(o, cn);

        GridView1.FooterRow.Cells[3].Text = cm.ExecuteScalar().ToString();

        string c = "SELECT SUM(total) from dcdb";
        cm = new SqlCommand(c, cn);

        GridView1.FooterRow.Cells[4].Text = cm.ExecuteScalar().ToString();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("PrintChallan.aspx");
    }
    protected void stocksummaryupdate()
    {
        string path = ConfigurationManager.AppSettings["mydb"];
        cn = new SqlConnection(path);
        cn.Open();

        string u = "UPDATE stock_summery SET stock=@stock1 WHERE product=@product1";
        cm = new SqlCommand(u, cn);
        cm.Parameters.AddWithValue("product1", DropDownList1.Text);
        cm.Parameters.AddWithValue("stock1", TextBox6.Text);
        cm.ExecuteNonQuery();
        
    }
}