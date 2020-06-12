package mod;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

public class MemberDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//인자생성자1
	public MemberDAO() {
		System.out.println("MemberDAO생성자 호출");
	}
	
	public MemberDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id = "suamil_user";
			String pw = "1234";
			con = DriverManager.getConnection(url,id,pw);
			System.out.println("DB연결성공");
		}
		catch(Exception e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	
	//인자생성자2
	public MemberDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("MariaJDBCDriver"));
			String id = "suamil_user";
			String pw = "1234";
			con = DriverManager.getConnection(
					ctx.getInitParameter("MariaConnectURL"),id,pw);
			System.out.println("DB연결성공");
		}
		catch(Exception e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}
	}
	
	//1. 아이디 중복체크
	public int registerID(String id) throws SQLException{
		String sql = "SELECT id FROM membership WHERE id=?";
		psmt = null;
		rs = null;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
			else {
				return 0;
			}
		}
		catch (Exception e) {
			System.out.println("registerID쿼리문 에러발생");
			e.printStackTrace();
		}
		finally {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
		}
		return -1; //DB오류
	}
	
	public int insertMember(MemberDTO dto) {
		int affected = 0;
		try {
			String sql = "INSERT INTO membership ( "
					+ "name, id, pass, tel, mobile, email, address) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPass());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getmobile());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getAddress());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("MemberDAO insertMember중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	//로그인
	public Map<String, String> getMemberMap(String id, String pass){
		Map<String, String> maps = new HashMap<String, String>();
		String sql = "SELECT id, pass, name FROM "
				+ "membership WHERE id=? AND pass=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				maps.put("id", rs.getString("id"));
				maps.put("pass", rs.getString("pass"));
				maps.put("name", rs.getString("name"));
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch(Exception e) {
			System.out.println("MemberDAO에 getMemberMap오류");
			e.printStackTrace();
		}
		return maps;
	}
	
	//DB자원해제
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