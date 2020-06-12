package connect;

public interface Dbinfo {
	String dirver = "org.mariadb.jdbc.Driver";
	//로컬정보
	String url = "jdbc:mariadb://localhost:3306/suamil_db";
	String id = "suamil_user";
	String pw = "1234";
	
	/*//웹서버 정보
	String url = "jdbc:mariadb://localhost:3306/dpwls4304";
	String id = "dpwls4304";
	String pw = "A4967582";*/
}
