package mod;

import java.sql.Date;

public class MemberDTO {
	
	private String name;
	private String id;
	private String pass;
	private String tel;
	private String mobile;
	private String email;
	private String address;
	private java.sql.Date regidate;
	
	public MemberDTO() {}
	
	public MemberDTO(String name, String id, String pass, String tel, String mobile, 
			String email, String address, Date regidate) {
		this.name=name;
		this.id=id;
		this.pass=pass;
		this.tel=tel;
		this.mobile=mobile;
		this.email=email;
		this.address=address;
		this.regidate = regidate;
	}
	
	//getter / setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getmobile() {
		return mobile;
	}

	public void setmobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public java.sql.Date getRegidate() {
		return regidate;
	}

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
}
