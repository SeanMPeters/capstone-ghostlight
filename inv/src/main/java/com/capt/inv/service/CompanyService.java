package com.capt.inv.service;

import java.util.List;
import java.util.Optional;

import com.capt.inv.model.Companies;

public interface CompanyService {
	List<Companies> searchCompany(String keyword);
	Optional<Companies> findByCompanyId(Long companyId);
	void deleteCompany(Long companyId);
	void save(Companies company);
	void newComp(String compName, String compPhone, String compStreet, String compCity, String compState, String compUrl);
	void updateCompany(String compName, String compPhone, String compStreet, String compCity, String compState, String compUrl);
	List<Companies> findAll();
}