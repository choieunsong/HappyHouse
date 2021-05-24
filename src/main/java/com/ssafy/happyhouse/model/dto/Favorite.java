package com.ssafy.happyhouse.model.dto;

public class Favorite {
	private int no;
	private int userno;
	private int dealno;
	private String AptName;
	private String dong;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getDealno() {
		return dealno;
	}
	public void setDealno(int dealno) {
		this.dealno = dealno;
	}
	public String getAptName() {
		return AptName;
	}
	public void setAptName(String aptName) {
		AptName = aptName;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	@Override
	public String toString() {
		return "Favorite [no=" + no + ", userno=" + userno + ", dealno=" + dealno + ", AptName=" + AptName + ", dong="
				+ dong + "]";
	}
	
}
