package com.capt.inv.model;

import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="companies")
public class Companies {
	
	public Companies() {
		super();
	}
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long companyId;
//	@Column(name="company")
	private String compName;
	private String compPhone;
	private String compStreet;
	private String compCity;
	private String compState;
	private String compUrl;
	private String compZip;
	
	private String compImage;
	private String compDescription;
	private String compStatus;
	private String compSeating;
	private String compTickethigh;
	private String compTicketlow;
	private String compCurrentshow;
	private String compDonate;
	
	@OneToMany(mappedBy="company", cascade=CascadeType.ALL)
	private List<Reviews> review;
	
	@OneToOne(mappedBy="company", cascade=CascadeType.ALL)
	private Users user;
	
	
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getCompPhone() {
		return compPhone;
	}
	public void setCompPhone(String compPhone) {
		this.compPhone = compPhone;
	}
	public String getCompStreet() {
		return compStreet;
	}
	public void setCompStreet(String compStreet) {
		this.compStreet = compStreet;
	}
	public String getCompCity() {
		return compCity;
	}
	public void setCompCity(String compCity) {
		this.compCity = compCity;
	}
	public String getCompState() {
		return compState;
	}
	public void setCompState(String compState) {
		this.compState = compState;
	}
	public String getCompUrl() {
		return compUrl;
	}
	public void setCompUrl(String compUrl) {
		this.compUrl = compUrl;
	}
	public String getCompZip() {
		return compZip;
	}
	public void setCompZip(String compZip) {
		this.compZip = compZip;
	}
	public String getCompImage() {
		return compImage;
	}
	public void setCompImage(String compImage) {
		this.compImage = compImage;
	}

	public String getCompDescription() {
		return compDescription;
	}
	public void setCompDescription(String compDescription) {
		this.compDescription = compDescription;
	}
	public String getCompStatus() {
		return compStatus;
	}
	public void setCompStatus(String compStatus) {
		this.compStatus = compStatus;
	}
	public String getCompSeating() {
		return compSeating;
	}
	public void setCompSeating(String compSeating) {
		this.compSeating = compSeating;
	}
	public String getCompTickethigh() {
		return compTickethigh;
	}
	public void setCompTickethigh(String compTickethigh) {
		this.compTickethigh = compTickethigh;
	}
	public String getCompTicketlow() {
		return compTicketlow;
	}
	public void setCompTicketlow(String compTicketlow) {
		this.compTicketlow = compTicketlow;
	}

	public String getCompCurrentshow() {
		return compCurrentshow;
	}
	public void setCompCurrentshow(String compCurrentshow) {
		this.compCurrentshow = compCurrentshow;
	}
	public String getCompDonate() {
		return compDonate;
	}
	public void setCompDonate(String compDonate) {
		this.compDonate = compDonate;
	}
	public List<Reviews> getReview() {
		return review;
	}
	public void setReview(List<Reviews> review) {
		this.review = review;
	}
	@Override
	public String toString() {
		return "Companies [companyId=" + companyId + ", compName=" + compName + ", compPhone=" + compPhone
				+ ", compStreet=" + compStreet + ", compCity=" + compCity + ", compState=" + compState + ", compUrl="
				+ compUrl + ", compZip=" + compZip + ", compImage=" + compImage + ", compDescription=" + compDescription
				+ ", compStatus=" + compStatus + ", compSeating=" + compSeating + ", compTickethigh=" + compTickethigh
				+ ", compTicketlow=" + compTicketlow + ", compCurrentshow=" + compCurrentshow + ", compDonate="
				+ compDonate + ", review=" + review + "]";
	}
	
	
	
	

	
	
	
	

	
	
	
	
	
	
	
	


	
	
}
