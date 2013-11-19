<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="rcim.*, java.sql.*, java.util.*"%>

<!-- Wrap all page content here -->
<div id="wrap">
    <div class="container">
      <!-- Fixed navbar -->
      <div class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand tip" data-toogle="tooltip" data-placement="bottom" title="Home"  href="${pageContext.servletContext.contextPath}/user/landingPage.jsp">RCIM</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a data-toogle="tooltip" data-placement="bottom" title="Apply for a subject contract" class="tip" href="${pageContext.servletContext.contextPath}/contract/contractapplication.jsp"><i class="fa fa-files-o"></i> Apply Now</a></li>
            <li><a data-toogle="tooltip" data-placement="bottom" title="View subject contract applications" class="tip" href="${pageContext.servletContext.contextPath}/contract/listContracts.jsp"><i class="fa fa-list-ul"></i> View Submissions</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a class="tip" data-toogle="tooltip" data-placement="bottom" title="This is you!"><i class="fa fa-user"></i> <%=MySQL.getUserData("name", (Integer) session.getAttribute("empId"))%> (Casual Academic Staff)</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-wrench"></i> Update Profile<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a data-toogle="tooltip" data-placement="left" title="Change your details" class="tip" href="${pageContext.servletContext.contextPath}/user/updateProfile.jsp"><i class="fa fa-pencil-square-o"></i> Edit Profile</a></li>
                <li><a data-toogle="tooltip" data-placement="left" title="Upload a new resume" class="tip" href="${pageContext.servletContext.contextPath}/upload/upload.jsp"><i class="fa fa-cloud-upload"></i> Resume Upload</a></li>
              </ul>
            </li>
            <li><a data-toogle="tooltip" data-placement="bottom" title="See you soon!" class="tip" href="${pageContext.servletContext.contextPath}/logoutController.jsp" onclick="return confirmLogOut()"><i class="fa fa-sign-out"></i> Logout </a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div> <!-- /container -->
    
<!-- Begin page content -->
<div class="container">
