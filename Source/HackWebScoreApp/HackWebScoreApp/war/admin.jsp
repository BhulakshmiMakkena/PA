<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection;"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Ashray online child abuse </title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/default.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <td><a href="admin">Admin</a></td>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="header">
    <tr>
        <td id="logo"><table><tr><td><img border="0" src="images/logo.jpg" width="90" height="90" /></td><td><h2>Ashray child abuse <span>database</span></h2></td></tr></table>
        </td>
        <td></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="menu">
    <tr>
        <td><ul>
                <li><a href="index.jsp">Home</a></li>
                <li  class="first active"><a href="#">About us</a></li>
                <li><a href="gallery.html">Gallery</a></li>
                <li><a href="donate.jsp">Donate</a></li>
                <li><a href="login.jsp">Login</a></li>                
                <li><a href="contact.html">Contact Us</a></li>
            </ul></td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="wrapper">
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" id="page">
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr valign="top">
                                <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" id="content">
                                        <tr>
                                            <td id="box2" class="box-style">
<%String signin = request.getParameter("signin");
if(signin==null) { %>                                            
<form action="register.jsp" onSubmit="return validate()" method="post">
 <center>
    <table align="center">
    <tr><td colspan="2"><h2>New User</h2></td></tr>
     <tr>
      <td align="left">NAME &nbsp;:</td>
      <td align="left"><Input type="text" name="name"></td>
     </tr>
         <tr>
        <td align="left">EMAIL ID &nbsp;:</td>
        <td align="left"><Input type="text" name="emailid"></td>
     </tr>
     <tr>
      <td align="left">PASSWORD &nbsp;:</td>
      <td align="left"><Input type="password" name="password"></td>
     </tr>
     <tr>
      <td align="left">GENDER &nbsp;:</td>
      <td align="left"><Input type="radio" name="sex" value="f" checked="checked">female
           <Input type="radio" name="sex" value="m">male</td>
     </tr>
         <tr>
      <td align="left">ORGANISATION TYPE &nbsp;:</td>
      <td align="left">
      <select name="organization">
      <option value="">-select-</option>
       <option value="ngo">NGO</option>
       <option value="pol">POLICE</option>
       </select>
       </td>
</tr>
     <tr>
        <td align="left">PHONE NO &nbsp;:</td>
        <td align="left"><Input type="text" name="phone_no"></td>
     </tr>
     <tr>
        <td align="left">ADDRESS &nbsp;:</td>
        <td align="left"><textarea rows="3" cols="15" name="address"></textarea> </td>
     </tr>
     <tr>
        <td align="left"><Input type="submit" value="SIGN IN" name="signin"></td>
        <td align="left"><Input type="reset" value="RESET"></td>
     </tr>
    </table>    
    </center>
</form>
<%} else{
Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:db2://localhost:50000/AOCA","db2admin","db2admin");
String query = "INSERT INTO DB2ADMIN.USERS(NAME, EMAIL, PASSWORD, GENDER, ORGANIZATION, PHNO, ADDRESS) VALUES ('"+
request.getParameter("name")+"', '"+
request.getParameter("emailid")+"', '"+
request.getParameter("password")+"', '"+
request.getParameter("sex")+"', '"+
request.getParameter("organization")+"', '"+
request.getParameter("phone_no")+"', '"+
request.getParameter("address")+"')";
System.out.println(query);
PreparedStatement ps = con.prepareStatement(query);
int flag = ps.executeUpdate();
 }%>
                                </td>
                                        </tr>
                                    </table></td>
                                <td><table width="100%" border="0" cellspacing="0" cellpadding="0" id="sidebar">
                                        <tr>
                                            <td id="box3" class="box-style">
                                <h2>Main Menu</h2>
                                <ul class="style1">
                                                    <li><a href="register.jsp">Join Us</a></li>
                                                    <li><a href="incident.jsp">Incident Entry</a></li>
                                                    
                                                    <li><a href="donate.jsp">Donate Us</a></li>
                                                    <li><a href="contact.html">Contact Us</a></li>
                                                    <li><a href="gallery.html">Gallery</a></li>
                                                    <li><a href="pm.html">Preventive Measures</a></li>
                                                </ul></td>
                                        </tr>
                                    </table></td>
                            </tr>
                        </table></td>
                </tr>
            </table></td>
    </tr>
</table>
</body>
</html>