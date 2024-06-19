package com.springCrud.Modal;

	import java.util.Arrays;
import java.util.Date;

import javax.persistence.Entity;
	import javax.persistence.GeneratedValue;
	import javax.persistence.GenerationType;
	import javax.persistence.Id;
	import javax.persistence.Lob;
	import javax.persistence.Temporal;
	import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

	@Entity
	public class Users{

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private int userId;
		private String firstName;
		private String lastName;
		private String email;
		private String password;
		private String mobileNumber;
		private String dob;
		private String gender;
		private String title;
		private String langauge;
		private String country;
		private String hobby;
		private int role; 	
		private byte[] image;
		
		
		
		
		
		
		public Users() {
			super();
			// TODO Auto-generated constructor stub
		}






		public int getUserId() {
			return userId;
		}






		public void setUserId(int userId) {
			this.userId = userId;
		}






		public String getFirstName() {
			return firstName;
		}






		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}






		public String getLastName() {
			return lastName;
		}






		public void setLastName(String lastName) {
			this.lastName = lastName;
		}






		public String getEmail() {
			return email;
		}






		public void setEmail(String email) {
			this.email = email;
		}






		public String getPassword() {
			return password;
		}






		public void setPassword(String password) {
			this.password = password;
		}






		public String getMobileNumber() {
			return mobileNumber;
		}






		public void setMobileNumber(String mobileNumber) {
			this.mobileNumber = mobileNumber;
		}






		public String getDob() {
			return dob;
		}






		public void setDob(String dob) {
			this.dob = dob;
		}






		public String getGender() {
			return gender;
		}






		public void setGender(String gender) {
			this.gender = gender;
		}






		public String getTitle() {
			return title;
		}






		public void setTitle(String title) {
			this.title = title;
		}






		public String getLangauge() {
			return langauge;
		}






		public void setLangauge(String langauge) {
			this.langauge = langauge;
		}






		public String getCountry() {
			return country;
		}






		public void setCountry(String country) {
			this.country = country;
		}






		public String getHobby() {
			return hobby;
		}






		public void setHobby(String hobby) {
			this.hobby = hobby;
		}






		public int getRole() {
			return role;
		}






		public void setRole(int role) {
			this.role = role;
		}






		public byte[] getImage() {
			return image;
		}






		public void setImage(byte[] image) {
			this.image = image;
		}
		
		
		
		
		






		



		



		
		
		
		
}
