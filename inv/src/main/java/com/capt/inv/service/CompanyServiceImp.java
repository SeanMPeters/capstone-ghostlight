package com.capt.inv.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capt.inv.model.Companies;
import com.capt.inv.repository.CompanyRepository;


@Service
@Transactional
public class CompanyServiceImp implements CompanyService {
	@Autowired
	private CompanyRepository companyRepository;
	
	@Override
	public List<Companies> findAll() {
		return companyRepository.findAll();
	}

	@Override
	public List<Companies> searchCompany(String keyword) {
		return companyRepository.searchCompany(keyword);
	}

	@Override
	public void deleteCompany(Long companyId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void save(Companies company) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCompany(String compName, String compPhone, String compStreet, String compCity, String compState,
			String compUrl) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Optional<Companies> findByCompanyId(Long companyId) {
		return companyRepository.findByCompanyId(companyId);
	}

	@Override
	public void newComp(String compName, String compPhone, String compStreet, String compCity, String compState,
			String compUrl) {
		// TODO Auto-generated method stub
		
	}
	
}
