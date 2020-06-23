package com.capt.inv.service;

import java.util.List;
import java.util.Optional;

import com.capt.inv.model.Users;

public interface UserService {

	Optional<Users> findByEmail(String email);
	Optional<Users> login(String email, String password);
	List<Users> searchUser(String keyword);
	Optional<Users> findById(Long id);
	void deleteUser(Long id);
	void save(Users newUser);
	void addRole(Long id, String role);
	void updateUser(String fname, String lname, String email);
	List<Users> findAll();
}
