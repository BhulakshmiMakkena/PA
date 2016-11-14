<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%page import="java.sql.*"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String id=req.getParameter("id");
String name=req.getParameter("name");
String email=req.getParameter("email");
String members=req.getParameter("members");
try {
	conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/HackathonWebScore?" +
		                                   "user=root&password=hershe2209@");
	PreparedStatement ps=conn.prepareStatement("Insert into Teams(id,name,email,members) values(?,?,?,?)");
	ps.setString(1,id );
	ps.setString(2,name );
	ps.setString(3,email );
	ps.setString(4,members );
	super.doPost(req,resp);
	stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT * FROM Teams");
    int result=ps.executeUpdate();
    if (result>=1){
    	out.print("Registered Successfully");
    }
    // or alternatively, if you don't know ahead of time that
    // the query will be a SELECT...

    if (stmt.execute("SELECT * FROM Teams")) {
        rs = stmt.getResultSet();
    }
    
} catch (SQLException ex) {
    // handle any errors
    out.println("SQLException: " + ex.getMessage());
    out.println("SQLState: " + ex.getSQLState());
    out.println("VendorError: " + ex.getErrorCode());
}
finally {
    // it is a good idea to release
    // resources in a finally{} block
    // in reverse-order of their creation
    // if they are no-longer needed

    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException sqlEx) { } // ignore

        rs = null;
    }

    if (stmt != null) {
        try {
            stmt.close();
        } catch (SQLException sqlEx) { } // ignore

        stmt = null;
    }
}
%>
</body>
</html>