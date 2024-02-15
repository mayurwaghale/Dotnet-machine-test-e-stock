<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="DC.aspx.cs" Inherits="DC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color:white;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 20px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>

    <form id="form1" runat="server">
  <div class="container">
    <h1>Challan Form</h1>
    
    <hr>
      Name
      <asp:TextBox ID="TextBox1" runat="server" placeholder="Name"></asp:TextBox>
    
      Email<br />
      <asp:TextBox ID="TextBox2" runat="server" placeholder="Email"></asp:TextBox>
      <br />
      <br />
    
      Mobile
      <asp:TextBox ID="TextBox3" runat="server" placeholder="Mobile"></asp:TextBox>
    
      DC ID
      <asp:TextBox ID="TextBox4" runat="server" placeholder="DC ID"></asp:TextBox>
    
      Select Product
      <asp:DropDownList ID="DropDownList1" runat="server" Width="1036px" Height="25px">
          <asp:ListItem>Juicer</asp:ListItem>
          <asp:ListItem>Bulb</asp:ListItem>
          <asp:ListItem>Ceiling Fan</asp:ListItem>
          <asp:ListItem>Clock</asp:ListItem>
          <asp:ListItem>Earphones</asp:ListItem>
          <asp:ListItem>Computer</asp:ListItem>
      </asp:DropDownList>
      <hr />

      Sale Price
      <asp:TextBox ID="TextBox5" runat="server" placeholder="Sale Price"></asp:TextBox>
    
       Currunt Stock<br />
      <asp:TextBox ID="TextBox6" runat="server" placeholder="Currunt Stock"></asp:TextBox>

       Quantity<br />
      <asp:TextBox ID="TextBox7" runat="server" placeholder="Quantity"></asp:TextBox>

      Total<br />
      <asp:TextBox ID="TextBox8" runat="server" placeholder="Total"></asp:TextBox>

      Date<br />
      <asp:TextBox ID="TextBox9" runat="server" placeholder="Date"></asp:TextBox>
    
      <hr>
      <asp:Button ID="Button1" runat="server" class="registerbtn" Text="Calculate" OnClick="Button1_Click" Width="1009px" />
      <asp:Button ID="Button2" runat="server" class="registerbtn" Text="Submit" OnClick="Button2_Click" Width="1009px" />
      <asp:Button ID="Button3" runat="server" class="registerbtn" Text="Show" OnClick="Button3_Click" Width="1010px" />
      <br />
      <br />
      
      <br />
      <asp:GridView ID="GridView1" runat="server" ShowFooter="true" CssClass="table" AutoGenerateColumns="False" BackColor="#000000" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
          <Columns>
              <asp:TemplateField HeaderText="DC ID">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox10" runat="server" BackColor="#00ffff" Text='<%# Eval("dcid") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Product">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox11" runat="server" BackColor="#ffccff" Text='<%# Eval("product") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Price">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox12" runat="server" BackColor="#ffccff" Text='<%# Eval("sale") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Quantity">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox13" runat="server" BackColor="#ffccff" Text='<%# Eval("qty") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Total">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox14" runat="server" BackColor="#ffccff" Text='<%# Eval("total") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
             
          </Columns>
          <FooterStyle BackColor="#CCCCCC" />
          <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
          <RowStyle BackColor="White" />
          <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F1F1F1" />
          <SortedAscendingHeaderStyle BackColor="#808080" />
          <SortedDescendingCellStyle BackColor="#CAC9C9" />
          <SortedDescendingHeaderStyle BackColor="#383838" />
      </asp:GridView>
      <br />
      <br />
      <asp:Button ID="Button4" runat="server" class="registerbtn" Text="Print Challan" OnClick="Button4_Click" Width="1009px" />
  </div>
  
  
    </form>

</body>
</html>

</asp:Content>

