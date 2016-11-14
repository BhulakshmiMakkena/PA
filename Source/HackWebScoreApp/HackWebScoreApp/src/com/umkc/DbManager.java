package com.umkc;

import java.sql.*;
import java.sql.SQLException;


public class DbManager{
	private static Connection conn = ConnectionManager.getInstance().getConnection();
	public static void Insert(GetSets set) throws ClassNotFoundException, SQLException{
		
		String sql	=	"INSERT INTO Teams (id,name,email,members) VALUES(?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, set.getid());
		ps.setString(2, set.getname());
		ps.setString(3, set.getemail());
		ps.setString(4, set.getmembers());
		ps.executeUpdate();
		ConnectionManager.getInstance().close();		
	}
	
	public static int checkUser(GetSets get) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		
		String sql	="SELECT COUNT(*) FROM Teams WHERE email=? AND password=?";
		PreparedStatement ps=conn.prepareStatement("SELECT COUNT(*) FROM Teams");
		ps.setString(1, get.getid());
		ps.setString(2, get.getname());
		ps.setString(3, get.getemail());
		ps.setString(4, get.getmembers());
		ResultSet rs= ps.executeQuery(sql);
		
		int count = 0;
		while(rs.next()){
			count	=	rs.getInt(1);
		}
		ConnectionManager.getInstance().close();
		return count;
		
	}
}
