using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BusinessObject;
using BusinessLogic;


public partial class PrintChallan : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cm;
    SqlDataReader dr;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Display Only Date
        Label3.Text = DateTime.Now.ToString("dd/MMMM/yyyy");

        TextBox1.Text = (string)Session["dcid"];
        TextBox2.Text = (string)Session["name"];
        TextBox3.Text = (string)Session["mobile"];

        string path = ConfigurationManager.AppSettings["mydb"];
        SqlConnection cn = new SqlConnection(path);
        cn.Open();

        string k = "SELECT * FROM dcdb where dcid=@dcid1";
        cm = new SqlCommand(k, cn);
        cm.Parameters.AddWithValue("dcid1", TextBox1.Text);

        dr = cm.ExecuteReader();
        //bind data to grid view
        GridView1.DataSource = dr;
        GridView1.DataBind();

        dr.Close();
        if (GridView1.FooterRow != null && GridView1.FooterRow.Cells.Count > 1)
        {
            GridView1.FooterRow.Cells[1].Text = "total";
        }
        else
        {
            Console.WriteLine("FooterRow or Cell[1] is null.");
        }

        string i = "SELECT SUM(qty) from dcdb where dcid=@dcid1";
        cm = new SqlCommand(i, cn);
        cm.Parameters.AddWithValue("dcid1", TextBox1.Text);
        if (GridView1.FooterRow != null && GridView1.FooterRow.Cells.Count > 3)
        {
            //GridView1.FooterRow.Cells[3].Text = cm.ExecuteScalar().ToString();
            object result = cm.ExecuteScalar();
            string resultText = result != null ? result.ToString() : string.Empty;
            GridView1.FooterRow.Cells[3].Text = resultText;
        }
        else
        {
            Console.WriteLine("Cell[3] is null.");
        }

        string y = "SELECT SUM(total) from dcdb where dcid=@dcid1";
        cm = new SqlCommand(y, cn);
        cm.Parameters.AddWithValue("dcid1", TextBox1.Text);
        //GridView1.FooterRow.Cells[4].Text = cm.ExecuteScalar().ToString();
       
        if (GridView1.FooterRow != null && GridView1.FooterRow.Cells.Count > 4)
        {
            try
            {
                object result = cm.ExecuteScalar();
                string resultText = result != null ? result.ToString() : string.Empty;

                GridView1.FooterRow.Cells[4].Text = resultText;
            }
            catch (Exception ex)
            {
                Console.WriteLine("An error occurred while setting the cell text: " + ex.Message);
            }
        }
        else
        {
            Console.WriteLine("FooterRow or Cell[4] is null.");
        }

        string o = "SELECT SUM(sale) from dcdb where dcid=@dcid1";
        cm = new SqlCommand(o, cn);
        cm.Parameters.AddWithValue("dcid1", TextBox1.Text);
        //GridView1.FooterRow.Cells[2].Text = cm.ExecuteScalar().ToString();
        try
        {
            
            if (GridView1.FooterRow != null && GridView1.FooterRow.Cells.Count > 2)
            {
               
                object result = cm.ExecuteScalar();
                string resultText = result != null ? result.ToString() : string.Empty;

               
                GridView1.FooterRow.Cells[2].Text = resultText;
            }
            else
            {
                Console.WriteLine("FooterRow or Cell[2] is null.");
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("An error occurred while setting the cell text: " + ex.Message);
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //MailMessage msg = new MailMessage();
        //SmtpClient sc = new SmtpClient();
        // How to use mailmessage object
        //msg.To.Add(TextBox1.Text);
        //msg.From = new MailAddress("mayur911297@gmail.com");// Your mail id
        //msg.Subject = "This is system name";
        //msg.Body = "Thanks for visit";
        // How to set html formate
        //msg.IsBodyHtml = true;
        // How to use smpt object ...set Host(server)gmail.com, yahoo.com etc...
        //sc.Host = "smtp.gmail.com";
        //sc.Port = 587;
        // Set the credentials
        //sc.Credentials = new System.Net.NetworkCredential("mayur911297@gmail.com", "nqtf ugvu okwn pjvq");
        // Enable Ssl certificate
        //sc.EnableSsl = true;  // Only work Https Domain
        // Send mail using Smtp object
        //sc.Send(msg);  // Pass mailmessage object

        //Label1.Text = "Mail send successfully";

        string path = ConfigurationManager.AppSettings["mydb"];
        SqlConnection cn = new SqlConnection(path);
        cn.Open();

        using (StringWriter sw=new StringWriter())
        {
            using(HtmlTextWriter hw=new HtmlTextWriter(sw))
            {
                Panel1.RenderControl(hw);

                StringReader sr = new StringReader(sw.ToString());

                MailMessage msg = new MailMessage();
                SmtpClient sc = new SmtpClient();

                msg.To.Add(TextBox4.Text);
                msg.From = new MailAddress("mayur911297@gmail.com");//Your mail ID
                msg.Subject = "This is testing Mail";
                msg.Body = sw.ToString();
                msg.IsBodyHtml = true;
                sc.Host = "smtp.gmail.com";
                sc.Port = 587;

                sc.UseDefaultCredentials = false;
                sc.Credentials = new System.Net.NetworkCredential("mayur911297@gmail.com", "dfpk sxkj nyny ugmt");
                sc.EnableSsl = true;
                sc.Send(msg);

            }
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }

}