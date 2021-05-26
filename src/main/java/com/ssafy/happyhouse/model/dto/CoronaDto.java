package com.ssafy.happyhouse.model.dto;

public class CoronaDto{
	private String sido;
	private String sigungu;
	private String hospital;
	private String address;
	private String lat;
	private String lng;
	private String city;
	private String gugun;
	
	public CoronaDto() {
		
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	@Override
	public String toString() {
		return "CoronaDto [sido=" + sido + ", sigungu=" + sigungu + ", hospital=" + hospital + ", address=" + address
				+ ", lat=" + lat + ", lng=" + lng + ", city=" + city + ", gugun=" + gugun + "]";
	}
	
	
	
	
	
}
