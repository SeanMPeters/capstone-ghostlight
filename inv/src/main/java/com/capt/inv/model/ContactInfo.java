package com.capt.inv.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="contactInfo")
public class ContactInfo {

	public ContactInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Id
	private Long id;
	
	private String street;
	private String zip;
	private String city;
	private String state;
	private String phone;
	
	@OneToOne
	@MapsId
	private Users user;
	
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "ContactInfo [id=" + id + ", street=" + street + ", zip=" + zip + ", city=" + city + ", state=" + state
				+ ", phone=" + phone + ", user=" + user + "]";
	}
	
	
	
	
	
}
