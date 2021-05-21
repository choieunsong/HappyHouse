package com.ssafy.happyhouse.model.dto;

public class MemberDto{
	private int userno;
	private String userid;
	private String password;
	private String email;
	private String username;
	private String address;
	private int state;
	public MemberDto() { }

	public MemberDto(String userid, String password, String email, String username, String address) {
		super();
		//this.userno = userno;
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.username = username;
		this.address = address;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "MemberDto [userno=" + userno + ", userid=" + userid + ", password=" + password + ", email=" + email
				+ ", username=" + username + ", address=" + address + "]";
	}
	
	
}
