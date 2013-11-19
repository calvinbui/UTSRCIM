<jsp:include page="/includes/header.jsp"/>
<h1 class="text-center">Request and Contract Information Management System</h1>	
<div class="container">
<form action="loginController.jsp" method="post" class="form-signin">
    <div id="login">
      <h2 class="form-signin-heading">Sign In:</h2>
      	<%
		String message = (String)session.getAttribute("message");
		if (message != null && message.equals("failLogin"))
		{
			out.print("<div class='alert alert-danger'>Login credentials are Incorrect!</div>");
		}
		session.setAttribute("message", "");
		session.invalidate();
	%>
      	<input type="text" class="form-control" placeholder="email address" name="email" required autofocus/><br>
        <input type="password" class="form-control" placeholder="password" name="password" required/>
       	       <button class="btn btn-lg btn-primary btn-block" data-toogle="tooltip" data-placement="right" title="Enter the RCIM System!" type="submit" data-loading-text='<i class="fa fa-spinner"></i> Logging In...' onclick="loading()"><i class="fa fa-sign-in"></i> Login</button>
       	     
    </div>
      <h2>Sign Up:</h2>
      <a data-toogle="tooltip" data-placement="right" title="Create an Account" href="register.jsp"><img src="img/signupemail.png"/></a> 
</form>
</div>

<script>
function loading()
{
	$('.btn').button('loading');
	setTimeout(function () 
	{
		$('.btn').button('reset');
    }, 3000);
}
</script>

<jsp:include page="includes/footer.jsp"/>