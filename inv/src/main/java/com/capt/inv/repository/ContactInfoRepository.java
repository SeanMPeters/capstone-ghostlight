package com.capt.inv.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.capt.inv.model.ContactInfo;

@Repository
public interface ContactInfoRepository extends JpaRepository<ContactInfo, Long> {

}
