<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="SellingList.aspx.cs" Inherits="SellingList" %>

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
    <h1>Create Product Selling List</h1>
    
    <hr>
      ID
      <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter ID"></asp:TextBox>
    
      Select Product<br />
      <asp:DropDownList ID="DropDownList1" runat="server" Height="35px" Width="160px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
      <br />
      <br />
    
      Max Purchese Cost
      <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Cost"></asp:TextBox>
    
     Enter Sell Cost
      <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Sell Cost"></asp:TextBox>
    
     Currunt Stock
      <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Currunt Stock"></asp:TextBox>
    
       Date<br />
      <asp:TextBox ID="TextBox5" runat="server" placeholder="Enter Date"></asp:TextBox>
    
      <hr>
      <asp:Button ID="Button1" runat="server" class="registerbtn" Text="Submit" OnClick="Button1_Click" />

      <asp:Button ID="Button2" runat="server" class="registerbtn" Text="Show" OnClick="Button2_Click" />
      <br />
      <br />
      <asp:DropDownList ID="DropDownList2" runat="server" Width="218px">
      </asp:DropDownList>
&nbsp;<asp:Button ID="Button3" runat="server" Text="Find" Width="110px" BackColor="#cc66ff" OnClick="Button3_Click" />
      <br />
      <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" BackColor="#000000" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
          <Columns>
              <asp:TemplateField HeaderText="ID">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox6" runat="server" BackColor="#00ffff" Text='<%# Eval("id") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Product">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox7" runat="server" BackColor="#ffccff" Text='<%# Eval("product") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Max Cost">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox8" runat="server" BackColor="#ffccff" Text='<%# Eval("maxcost") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Sell Cost">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox9" runat="server" BackColor="#ffccff" Text='<%# Eval("selcost") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Stock">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox10" runat="server" BackColor="#ffccff" Text='<%# Eval("cstock") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField>
                  <ItemTemplate>
                      <asp:Button ID="Button4" runat="server" Text="Update" BackColor="#ffff00" OnClick="bt1_click" />
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