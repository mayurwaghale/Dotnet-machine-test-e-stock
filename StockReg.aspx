<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="StockReg.aspx.cs" Inherits="StockReg" %>

<%-- Add content controls here --%>

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
  padding: 16px;
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
    <h1>Stock Registration</h1>
    
    <hr>
      ID
      <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter ID"></asp:TextBox>
    
      Select vendor name
      <br />
      <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" Width="188px" AutoPostBack="false">
      </asp:DropDownList>
    <br />
      <br />
      Vendor Mobile
    <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter mobile no."></asp:TextBox>
    
       Select or Enter Product
      <br />
      <asp:DropDownList ID="DropDownList2" runat="server" Width="188px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
          <asp:ListItem>Computer</asp:ListItem>
          <asp:ListItem>Earphones</asp:ListItem>
          <asp:ListItem>Juicer</asp:ListItem>
          <asp:ListItem>Bulb</asp:ListItem>
          <asp:ListItem>Ceiling_Fan</asp:ListItem>
          <asp:ListItem>Clock</asp:ListItem>
          <asp:ListItem Value="Add New Product">Add New Product</asp:ListItem>
      </asp:DropDownList>
      <br />
      <asp:TextBox ID="TextBox17" runat="server" placeholder="Enter Product Name" Visible="False"></asp:TextBox>
      <br />
      <asp:Button ID="Button6" runat="server" Text="Add Product" Visible="False" Width="234px" OnClick="Button6_Click" />
      <br />
      <br />
      Cost
      <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Cost"></asp:TextBox>

      Quantity
      <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Quantity"></asp:TextBox>

      <asp:Button ID="Button1" runat="server" class="registerbtn" Text="Calculate" OnClick="Button1_Click" />
      

      Total Amount
      <asp:TextBox ID="TextBox5" runat="server" placeholder="Total Amount"></asp:TextBox>

      Stock Count
      <asp:TextBox ID="TextBox6" runat="server" placeholder="Stock Count"></asp:TextBox>
    

      <asp:Button ID="Button2" runat="server" class="registerbtn" Text="Submit" OnClick="Button2_Click" />
      <asp:Button ID="Button3" runat="server" class="registerbtn" Text="Show" OnClick="Button3_Click" />
      <br />
      <br />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#000000" BorderColor="#000000" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#000000" CssClass="table" ShowFooter="True">
          <Columns>
              <asp:TemplateField HeaderText="ID">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox7" runat="server" BackColor="#00ffff" Text='<%# Eval("id") %>' ></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Product Name">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox8" runat="server" BackColor="#ffccff" Text='<%# Eval("product") %>' ></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Stock">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox9" runat="server" BackColor="#ffccff" Text='<%# Eval("scount") %>' ></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Total">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox10" runat="server" BackColor="#ffccff" Text='<%# Eval("total") %>' ></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField>
                  <ItemTemplate>
                      <asp:Button ID="Button4" runat="server" Text="View History" OnClick="bt1_click" BackColor="#66ff33" />
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
      <asp:GridView ID="GridView2" runat="server" CssClass="table" ShowFooter="true" AutoGenerateColumns="False" BackColor="#000000" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
          <Columns>
              <asp:TemplateField HeaderText="ID">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox11" runat="server" Text='<%# Eval("id") %>' BackColor="#00ffff"></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Vendor Name">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox12" runat="server" Text='<%# Eval("vendor") %>' BackColor="#ffcccc"></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Cost">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox13" runat="server" Text='<%# Eval("cost") %>' BackColor="#ffcccc"></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Quantity">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox14" runat="server" Text='<%# Eval("qty") %>' BackColor="#ffcccc"></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Total">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox15" runat="server" Text='<%# Eval("total") %>' BackColor="#ffcccc"></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Add New QTY">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox16" runat="server" BackColor="#ffcccc"></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Action">
                  <ItemTemplate>
                      <asp:Button ID="Button5" runat="server" Text="Update" BackColor="#ffff00" />
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
  </div>
  
  
    </form>

</body>
</html>

</asp:Content>