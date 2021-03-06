<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%!Connection con1;
	Statement st1;
	ResultSet rs1;
	String h, w, a, s, u;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DynamiCare Health</title>
<style type="text/css">
#userdetails {
	border: 1px solid black;
	background-color: white;
	color: black;
	padding: 6px;
	border-radius: 20px;
	font-family: helvetica;
	position: relative;
	width: 40%;
	left: 300px;
	height: 350px;
	top: 80px;
}

.icons {
	border: 1px;
	padding: 6px;
	height: 50px;
}

a {
	color: white;
	text-decoration: none;
}

.back {
	width: 100%;
	position: absolute;
	z-index: -1;
	left: 0%;
	top: 48px;
}

.head {
	text-align: center;
	position: absolute;
	left: 1%;
	width: 45%;
	height: 76%;
	color: black;
	vertical-align: middle;
	top: 10%
}

.profile {
	width: 20%;
}

.text {
	position: relative;
	top: 45px;
	font-size: 90px;
	font-weight: bolder;
}

.topnav {
	overflow: hidden;
	background-color: #333;
	position: absolute;
	top: 0px;
	width: 100%;
	left: 0px;
}

.topnav a {
	float: left;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #4CAF50;
	color: white;
}

.dropbtn {
	background-color: #333;
	color: #f2f2f2;
	padding: 16px;
	font-size: 17px;
	border: none;
	padding: 14px 16px;
	font-family:serif;
}

.dropdown {
	position: absolute;
	display: inline-block;
	top:0px;
	left:400px;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 220px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	text-decoration: none;
	display: block;
	padding:12px 16px;
	font-size:16px;
}

.dropdown-content a:hover {
	background-color: #ddd;
	font-weight:bold;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #ddd;
	color:black;
}
</style>
</head>

<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if (session.getAttribute("user") == null) {
			response.sendRedirect("Login1.jsp");
		}
		if (session.getAttribute("msg") != null) {
			String message = session.getAttribute("msg").toString();
			out.println("<script>alert(\"" + message + "\")</script>");
			session.removeAttribute("msg");
		}
	%>
	<center>
		<div class="topnav">
			<a href="" class="active"> DC-Health</a> 
			<a href="DetailsPat.jsp">View Details</a> 
			<a href="Emergency.jsp"> Emergency Contacts</a> 
			<a href="#">Appointment</a>
			<a href="Payments.jsp"> Payments </a> 
			<a href="Reports.jsp">Reports </a> 
			<a href="Logout.jsp" style="float: right;">Logout</a>
		</div>

		<div class="dropdown">
			<button class="dropbtn">Appointment</button>
			<div class="dropdown-content">
				<a href="AppointmentPat.jsp">Book Appointment</a> 
				<a href="AppointmentCan.jsp">Cancel Appointment</a>
				<a href="AppointmentResch.jsp">Reschedule Appointment</a>
				<a href="AppointmentHis.jsp">Appointment History</a>
			</div>
		</div>
		
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con1 = DriverManager.getConnection("jdbc:mysql://localhost/dchealth?serverTimezone=UTC", "root", "");

				st1 = con1.createStatement();

				u = session.getAttribute("user").toString();

				rs1 = st1.executeQuery("SELECT `height`,`weight`,`sex`,`age` FROM `patientdetails` WHERE `username`='"
						+ u + "' LIMIT 1");

				while (rs1.next()) {
					h = rs1.getString(1);
					w = rs1.getString(2);
					s = rs1.getString(3);
					a = rs1.getString(4);
				}
			} catch (Exception e) {
				out.println(e);
			}
		%>
		<img class="back" alt="back" src="images/lhc.jpg">

		<div class="head">
			<span class="text">Welcome to <br>DynamiCare Health
			</span>
		</div>

		<div id="userdetails">
			<center>
				<%
					if (s.equals("Male")) {
						out.println("<img src='images/profileMale.png' class='profile'/>");
					} else {
						out.println("<img src='images/profileFemale.png' class='profile'/>");
					}
				%>
				<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User Details</h2>
				<table style="font-family: verdana;" cellpadding="6">
					<tr>
						<td><b>User Name:</b></td>
						<td><%=u%></td>
					</tr>

					<tr>
						<td><b>Age: </b></td>
						<td><%=a%></td>
					</tr>

					<tr>
						<td><b>Sex: </b>
						<td><%=s%></td>
					</tr>

					<tr>
						<td><b>Height: </b>
						<td><%=h%></td>
					</tr>

					<tr>
						<td><b>Weight: </b>
						<td><%=w%></td>
					</tr>
				</table>
			</center>
		</div>

	</center>

	<%
		session.setAttribute("user", u);
	%>
</body>
</html>