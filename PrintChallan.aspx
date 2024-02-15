<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="PrintChallan.aspx.cs" Inherits="PrintChallan" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat= "server">
    <html>
        <head>
            <style>
                h4{
                    text-align:right;
                }
            </style>
        </head>
    </html>
    <form id="form1" runat="server" style="border: medium solid #000000; width: 893px; height: 911px; font-weight: bold;">
<asp:Panel ID="Panel1" runat="server" Height="742px" BackColor="#ccffff">
<div class="box">
    <header>
 <center>
     Challan/Invoice
     <br />
     Shree Ram Electronics
     <br />
     New lakshmi nagar, Nagpur
     <br />
     Mobile No.- +91 9112972594
    </center>
        </header>
    <hr style="color:Black; font-weight: bold;" />
    </div>
  <div class="mb-3" align="left">
      <h4>
      <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Black" Text="Date :"></asp:Label>
      <asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" 
          ForeColor="Black"></asp:Label>
          </h4>
      <br />
  
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" 
          ForeColor="Black" Text="DC ID"></asp:Label>
      &nbsp;&nbsp;&nbsp;
      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
      <br />
      &nbsp;
      <br />
      
      </div>

       <div class="mb-3" align="left">
       
           &nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Black" 
               Text="Name"></asp:Label>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
           <br />
           <br />
       </div>

         <div class="mb-3" align="left">
         
             &nbsp;&nbsp;&nbsp;
             <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Black" 
                 Text="Mobile"></asp:Label>
             &nbsp;&nbsp;
             <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
             <br />
             <br />
         </div>
          <hr style="color:Black; font-weight: bold;" />
          <div class="mb-3" align="left" >
          
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:GridView 
                  ID="GridView1" runat="server" 
                  AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" 
                  BorderStyle="Solid" BorderWidth="3px" CellPadding="4" Height="128px" 
                  Width="874px" CellSpacing="2" ShowFooter="True" ForeColor="Black">
                  <Columns>
                      <asp:BoundField DataField="dcid" HeaderText="SrNo" />
                      <asp:BoundField DataField="product" HeaderText="Product" />
                      <asp:BoundField DataField="sale" HeaderText="Price" />
                      <asp:BoundField DataField="qty" HeaderText="Qty" />
                      <asp:BoundField DataField="total" HeaderText="Total" />
                  </Columns>
                  <FooterStyle BackColor="#CCCCCC" />
                  <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                  <PagerStyle ForeColor="Black" HorizontalAlign="Left" BackColor="#CCCCCC" />
                  <RowStyle BackColor="White" />
                  <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F1F1F1" />
                  <SortedAscendingHeaderStyle BackColor="#808080" />
                  <SortedDescendingCellStyle BackColor="#CAC9C9" />
                  <SortedDescendingHeaderStyle BackColor="#383838" />
              </asp:GridView>
           <%--   <asp:FormView ID="FormView1" runat="server" Height="118px" 
                  Width="574px">

                        <ItemTemplate>
                        
                         <table style="width:93%; height:95px;">
                               
                                    <tr>
                                        <td align="justify" class="style8">
                                            <table align="center" border="1" frame="box" rules="rows" style="padding: 1px; margin: auto; width: 478px;
                                            height: 15px;">
                                                <tr>
                                                    <th style="height: 26px">
                                                        SrNo
                                                    </th>
                                                    <th style="height: 26px">
                                                        Product
                                                    </th>
                                                    <th style="height: 26px">
                                                        Price
                                                    </th>
                                                    <th style="height: 26px">
                                                        Qty
                                                    </th>
                                                    <th style="height: 26px">
                                                        Total
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <%#Eval("dcid")%>
                                                    </td>
                                                    <td>
                                                        <%#Eval("product")%>
                                                    </td>
                                                    <td>
                                                        <%#Eval("sale")%>
                                                    </td>
                                                    <td>
                                                        <%#Eval("qty")%>
                                                    </td>
                                                    <td>
                                                        <%#Eval("total")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                        
                        </ItemTemplate>

                        </asp:FormView>--%>
                         <hr style="color:Black; font-weight: bold;" />
              <br />
              &nbsp;&nbsp;&nbsp; Refund Policy<br /> <br />
              &nbsp;&nbsp; 1. Tax Deduct 5% Then Return <br />
              &nbsp;&nbsp; 2. Damage Product No Return <br />

&nbsp;<br />

              <footer>
                  &nbsp;&nbsp; Regards
                  <br />
                  &nbsp;&nbsp; R.K. Gupta<br /> &nbsp;&nbsp;
                  <img src="pic/signature.png" height="30" width="90" />
                  <br />
              </footer>
          
          </div>

      
 </asp:Panel>
    <br />
        
    
        <center>
            Enter Mail ID:<br />
&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
    <asp:Button ID="Button1" runat="server" Text="Send " class="btn btn-outline-primary"
                            OnClick="Button1_Click" BackColor="White" BorderColor="Red" />
            <br />

    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </center>
    <br />
   </form>
    <br />
    
    <br />
</asp:Content>

