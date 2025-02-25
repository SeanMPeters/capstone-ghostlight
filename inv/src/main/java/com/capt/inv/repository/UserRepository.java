package com.capt.inv.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.capt.inv.model.Users;

@Repository
public interface UserRepository extends JpaRepository<Users, Long> {

	Optional<Users> findByEmail(String email); 
	
	@Query("FROM Users WHERE email=?1 AND password=?2")
	Optional<Users> login(String email, String password);
	
	@Query("FROM Users u WHERE u.lname=?1 OR u.fname=?1")
	List<Users> searchUser(String keyword);
	
	Optional<Users> findById(Long id); 
}
