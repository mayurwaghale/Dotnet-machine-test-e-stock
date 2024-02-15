<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html lang="en">
  <head>
  	<title>Login 06</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">

	</head>
	<body>
        <form id="form1" runat="server">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"></h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-7">
					<div class="login-wrap">
						<div action="#" class="signin-form d-md-flex">
							<div class="half p-4 py-md-5">
			      		<div class="w-100">
			      			<h3 class="mb-4">Sign In</h3>
			      		</div>
			      		<div class="form-group mt-3">
			      			<label class="label" for="name">Email</label>
    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
			      			
			      		</div>
		            <div class="form-group">
		            	<label class="label" for="password">Password</label>
        <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" Text="." ForeColor="#cc0000"></asp:Label>
		              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
        <asp:Button ID="Button1" runat="server" class="form-control btn btn-secondary rounded submit px-3" Text="Sign In" OnClick="Button1_Click" />
                        
		            </div>
		          </div>
							<div class="half p-4 py-md-5 bg-primary">
		            <div class="form-group">
		            	
		            </div>
		            <div class="form-group d-md-flex">
		            	<div class="w-50 text-left">
			            	
									</div>
									
		            </div>
		            <p class="w-100 text-center" style="color:white;">&nbsp;</p>
			          <div class="w-100">
									    <p class="w-100 text-center" style="color:white;">Welcome to E-Stock System</p>
										<p class="w-100 text-center" style="color:white;">Introduction about E-Stock</p>
                                        <p class="w-100 text-center" style="color:white;">Facilities about E-Stock</p>
                                        
                                        <br />
                                        <p class="w-100 text-center" style="color:white;">Developed By:- Mayur Waghale</p>
                                        
									
								</div>
		          </div>
	          </div>
	        </div>
	      </div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

            </form>
	</body>
</html>
