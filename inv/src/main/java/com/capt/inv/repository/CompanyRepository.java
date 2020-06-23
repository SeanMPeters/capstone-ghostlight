package com.capt.inv.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.capt.inv.model.Companies;

@Repository
public interface CompanyRepository extends JpaRepository<Companies, Long> {

	Optional<Companies> findByCompanyId(long companyId);
	
	@Query("FROM Companies WHERE compName=?1")
	List<Companies> searchCompany(String keyword); 
	
	
}
