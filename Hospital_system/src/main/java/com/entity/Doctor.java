package com.entity;

public class Doctor {
		private int id;
		private String name;
		private String dob;
		private String qualif;
		private String specialist;
		private String email;
		private String mobno;
		private String passw;
		
		
		
		
		
		public Doctor() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Doctor( String name, String dob, String qualif, String specialist, String email, String mobno,
				String passw) {
			super();
			
			this.name = name;
			this.dob = dob;
			this.qualif = qualif;
			this.specialist = specialist;
			this.email = email;
			this.mobno = mobno;
			this.passw = passw;
		}
		
		
		
		
		public Doctor(int id, String name, String dob, String qualif, String specialist, String email, String mobno,
				String passw) {
			super();
			this.id = id;
			this.name = name;
			this.dob = dob;
			this.qualif = qualif;
			this.specialist = specialist;
			this.email = email;
			this.mobno = mobno;
			this.passw = passw;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDob() {
			return dob;
		}
		public void setDob(String dob) {
			this.dob = dob;
		}
		public String getQualif() {
			return qualif;
		}
		public void setQualif(String qualif) {
			this.qualif = qualif;
		}
		public String getSpecialist() {
			return specialist;
		}
		public void setSpecialist(String specialist) {
			this.specialist = specialist;
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
		public String getPassw() {
			return passw;
		}
		public void setPassw(String passw) {
			this.passw = passw;
		}
		
}
