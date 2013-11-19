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
          <a data-toogle="tooltip" data-placement="bottom" title="Home" class="navbar-brand tip" href="${pageContext.servletContext.contextPath}/user/landingPage.jsp">RCIM</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-users"></i> Manage Users <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a data-toogle="tooltip" data-placement="right" title="Create a new user" class="tip" href="${pageContext.servletContext.contextPath}/register.jsp"><i class="fa fa-plus"></i> Create User</a></li>
                <li><a data-toogle="tooltip" data-placement="right" title="Show/Edit Users" class="tip" href="${pageContext.servletContext.contextPath}/user/listUsers.jsp"><i class="fa fa-list-ul"></i> List Users</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-book"></i> Manage Subjects <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a data-toogle="tooltip" data-placement="right" title="Create a new subject" class="tip" href="${pageContext.servletContext.contextPath}/subject/createSubject.jsp"><i class="fa fa-plus"></i> Create Subject</a></li>
                <li><a data-toogle="tooltip" data-placement="right" title="Show/Edit Subjects" class="tip" href="${pageContext.servletContext.contextPath}/subject/listSubjects.jsp"><i class="fa fa-list-ul"></i> List Subjects</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-money"></i> Manage Rates <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a data-toogle="tooltip" data-placement="right" title="Create a new rate" class="tip" href="${pageContext.servletContext.contextPath}/rate/createRate.jsp"><i class="fa fa-plus"></i> Create Rate</a></li>
                <li><a data-toogle="tooltip" data-placement="right" title="Show/Edit Rates" class="tip" href="${pageContext.servletContext.contextPath}/rate/listRates.jsp"><i class="fa fa-list-ul"></i> List Rates</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a data-toogle="tooltip" data-placement="bottom" title="This is you!" class="tip" ><i class="fa fa-user"></i> <%=MySQL.getUserData("name", (Integer) session.getAttribute("empId"))%> (System Administrator)</a></li>
            <li><a data-toogle="tooltip" data-placement="bottom" title="Update your details" class="tip" href="${pageContext.servletContext.contextPath}/user/updateProfile.jsp"><i class="fa fa-wrench"></i> Update Profile</a></li>
            <li><a data-toogle="tooltip" data-placement="bottom" title="See you soon!" class="tip" href="${pageContext.servletContext.contextPath}/logoutController.jsp" onclick="return confirmLogOut()"><i class="fa fa-sign-out"></i> Logout </a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div> <!-- /container -->
<!-- Begin page content -->
<div class="container">