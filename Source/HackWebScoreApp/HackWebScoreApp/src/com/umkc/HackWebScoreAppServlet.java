package com.umkc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class HackWebScoreAppServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
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
			PreparedStatement ps=conn.prepareStatement("Insert into Teams (id,name,email,members) values (?,?,?,?)");
			ps.setString(1,id );
			ps.setString(2,name );
			ps.setString(3,email );
			ps.setString(4,members );
			stmt = conn.createStatement();
		    rs = stmt.executeQuery("SELECT * FROM Teams");
		    int result=ps.executeUpdate();
		    if (result>=1){
		    	System.out.print("Registered Successfully");
		    }
		    // or alternatively, if you don't know ahead of time that
		    // the query will be a SELECT...

		    if (stmt.execute("SELECT * FROM Teams")) {
		        rs = stmt.getResultSet();
		    }
		    
		} catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
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
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hdnParam	=	request.getParameter("form");
		if(hdnParam.equals("Send")){
			String id=request.getParameter("id");
			String name	=request.getParameter("name");
			String email	=request.getParameter("email");	
			String members	=request.getParameter("members");
			
		
			
			GetSets sets=new GetSets();
			sets.setid(id);
			sets.setname(name);
			sets.setemail(email);
			sets.setmembers(members);
			
			try {
				DbManager.Insert(sets);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//		}
//		if(hdnParam.equals("login")){
//				String userName	=	request.getParameter("name");
//				String password	=	request.getParameter("");
//				if((userName.equals("admin")) && (password.equals("admin"))){
//					response.sendRedirect("admin.jsp");
//				}else{
//					GetsSets set	=	new GetsSets();
//					
//					set.setEmail(userName);
//					set.setPassword(password);
//					try {
//						int checkUser	=	DbManager.checkUser(set);
//						System.out.println(checkUser);
//							if(checkUser == 1){
//								response.sendRedirect("welcome.jsp");
//							}else{
//								response.sendRedirect("login.jsp");
//							}
//					} catch (ClassNotFoundException | SQLException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//				}
//		}
		 
	}
	}
}

