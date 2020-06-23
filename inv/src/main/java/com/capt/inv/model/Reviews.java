package com.capt.inv.model;

import java.util.Optional;

import javax.persistence.*;


@Entity
@Table(name="reviews")
public class Reviews {
	
	public Reviews() {
		super();
	}
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long reviewId;
	
	@Temporal(TemporalType.TIMESTAMP)
	private java.util.Date myDate;
	
	private String text;
	
	
	@ManyToOne(cascade=CascadeType.DETACH) 
	@JoinColumn(name="company_id")
	private Companies company;
	
	@ManyToOne(cascade=CascadeType.DETACH) 
	@JoinColumn(name="email")
	private Users user;



	public java.util.Date getMyDate() {
		return myDate;
	}


	public void setMyDate(java.util.Date myDate) {
		this.myDate = myDate;
	}


	public Long getReviewId() {
		return reviewId;
	}


	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}


	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}


	public Companies getCompany() {
		return company;
	}


	public void setCompany(Companies company) {
		this.company = company;
	}


	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}


	
	//'The force is with this company.', '2020-07-22 08:08:11', '101',


	
	
	
	

	
	
	
	
	
	
	
	


	
	
}
