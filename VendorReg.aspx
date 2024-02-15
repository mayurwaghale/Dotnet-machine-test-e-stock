<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="VendorReg.aspx.cs" Inherits="VendorReg" %>

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
    <h1>Vendor Registration Form</h1>
    
      <hr>
      <asp:Label ID="Label1" runat="server" Text="." Visible="true" ForeColor="#ff0000"></asp:Label><br />
      ID
    <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter ID"></asp:TextBox>
    
      Vendor Name
    <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter Name"></asp:TextBox>
    
      City
      <br />
    <asp:DropDownList ID="DropDownList1" runat="server" class="container" Height="35px" Width="833px">
        <asp:ListItem>Nagpur</asp:ListItem>
        <asp:ListItem>Nashik</asp:ListItem>
        <asp:ListItem>Puna</asp:ListItem>
        <asp:ListItem>Mumbai</asp:ListItem>
      </asp:DropDownList>
    <br />
      <br />
      Address
      <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter Address"></asp:TextBox>

      Mobile no
      <asp:TextBox ID="TextBox4" runat="server" placeholder="Enter Mobile no"></asp:TextBox>
    

      <asp:Button ID="Button1" runat="server" class="registerbtn" Text="Submit" OnClick="Button1_Click" />
      <asp:Button ID="Button2" runat="server" class="registerbtn" Text="Show" OnClick="Button2_Click" />

      <br />
      <br />
      <br />
      Enter vendor Mobile No.
      <asp:TextBox ID="TextBox5" runat="server" placeholder="Enter vendor Mobile No." BorderColor="#04AA6D"></asp:TextBox>
      <br />
      <asp:Button ID="Button3" runat="server" class="registerbtn" Text="Find" OnClick="Button3_Click" />
      <br />
      <br />
      <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" BorderColor="#000000" HeaderStyle-BackColor="#ff3300" FooterStyle-BackColor="#ff3300" BackColor="#000000" ShowFooter="True" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="#000000">
          <Columns>
              <asp:TemplateField HeaderText="ID">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("id") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Name">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="City">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox8" runat="server" Text='<%# Eval("city") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Address">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox9" runat="server" Text='<%# Eval("address") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Mobile">
                  <ItemTemplate>
                      <asp:TextBox ID="TextBox10" runat="server" Text='<%# Eval("mobile") %>'></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Status">
                  <ItemTemplate>
                      <asp:DropDownList ID="DropDownList2" runat="server" class="container">
                          <asp:ListItem>Block</asp:ListItem>
                          <asp:ListItem>Unblock</asp:ListItem>
                      </asp:DropDownList>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField>
                  <ItemTemplate>
                      <asp:Button ID="Button4" runat="server" BackColor="#ffff00" Text="Update" OnClick="bt1_click" />
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField>
                  <ItemTemplate>
                      <asp:Button ID="Button5" runat="server" BackColor="#ff0000" Text="Delete" OnClick="bt2_click" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>

<FooterStyle BackColor="#CCCCCC"></FooterStyle>

<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>
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