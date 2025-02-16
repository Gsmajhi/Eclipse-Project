package com.entity;

public class Appointment {
	private int id;
	private int userId;
	private String name;
	private String gender;
	private String age;
	private String appodate;
	private String email;
	private String mobno;
	private String disease;
	private int doctorId;
	private String address;
	private String status;
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Appointment(int userId, String name, String gender, String age, String appodate, String email, String mobno,
			String disease, int doctorId, String address, String status) {
		super();
		
		this.userId = userId;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.appodate = appodate;
		this.email = email;
		this.mobno = mobno;
		this.disease = disease;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}
	public Appointment(int id,int userId, String name, String gender, String age, String appodate, String email, String mobno,
			String disease, int doctorId, String address, String status) {
		super();
		this.id=id;
		this.userId = userId;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.appodate = appodate;
		this.email = email;
		this.mobno = mobno;
		this.disease = disease;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAppodate() {
		return appodate;
	}
	public void setAppodate(String appodate) {
		this.appodate = appodate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
