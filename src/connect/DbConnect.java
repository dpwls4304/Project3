package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbConnect {
	
	public Connection con;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public DbConnect() {
		try {
			Class.forName(Dbinfo.dirver);
			con = DriverManager.getConnection(Dbinfo.url, Dbinfo.id, Dbinfo.pw);
			System.out.println("DB연결성공");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public boolean isConnect() {
		if(con==null)
			return false;
		else
			return true;
	}
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			System.out.println("자원반납시 예외발생");
		}
	}
}
