package com.ssafy.happyhouse.model.dto;

public class BaseAddress{
	private String num ;
	private String city;
	private String code;
	private String dongcode;
	private String gugun;
	private String dong;
	private String lat ;
	private String lng;
	
	public BaseAddress() {
		
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDongcode() {
		return dongcode;
	}

	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "BaseAddress [num=" + num + ", city=" + city + ", code=" + code + ", dongcode=" + dongcode + ", gugun="
				+ gugun + ", dong=" + dong + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
}
