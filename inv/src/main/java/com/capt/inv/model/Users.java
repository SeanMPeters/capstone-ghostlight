package com.capt.inv.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="users")
public class Users {
	
	public Users() {
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@Column(name="username")
	private String fname;
	private String lname;
	private String password;
	private String email;
	@Transient
	private String password2;
	private String role;
	private String image;
	
	@OneToOne(mappedBy="user", cascade=CascadeType.ALL)
	ContactInfo contactinfo;
	
	@OneToOne
	@JoinColumn(name="company_id")
	private Companies company;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private List<PaymentMethod> paymentMethod;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.ALL)
	private List<Reviews> review;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
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
	
	
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public ContactInfo getContactinfo() {
		return contactinfo;
	}
	public void setContactinfo(ContactInfo contactinfo) {
		this.contactinfo = contactinfo;
	}
	
	public List<PaymentMethod> getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(List<PaymentMethod> paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public List<Reviews> getReview() {
		return review;
	}
	public void setReview(List<Reviews> review) {
		this.review = review;
	}
	
	
	public Companies getCompany() {
		return company;
	}
	public void setCompany(Companies company) {
		this.company = company;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", fname=" + fname + ", lname=" + lname + ", password=" + password + ", email="
				+ email + ", password2=" + password2 + ", role=" + role + ", image=" + image + ", contactinfo="
				+ contactinfo + ", paymentMethod=" + paymentMethod + "]";
	}
	
	
	
	
	
	
	


	
	
}
