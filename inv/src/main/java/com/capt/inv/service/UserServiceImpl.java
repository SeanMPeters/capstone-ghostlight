package com.capt.inv.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capt.inv.model.Users;
import com.capt.inv.repository.UserRepository;


@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public Optional<Users> findByEmail(String email) {
		return userRepository.findByEmail(email);
	}

	@Override
	public Optional<Users> login(String email, String password) {
		return userRepository.login(email, password);
	}

	@Override
	public List<Users> searchUser(String keyword) {
		return userRepository.searchUser(keyword);
	}

	@Override
	public Optional<Users> findById(Long id) {
		return userRepository.findById(id);
	}

	@Override
	public void deleteUser(Long id) {
		userRepository.deleteById(id);
	}

	@Override
	public void save(Users user) {
		userRepository.save(user);
	}

	@Override
	public void addRole(Long id, String role) {
		findById(id).ifPresent(a->{
			a.setRole(role);	
		});
	}	

	@Override
	public void updateUser(String fname, String lname, String email) {
		findByEmail(email).ifPresent(a->{
			a.setFname(lname);
			a.setLname(fname);
	
		});
	}

	@Override
	public List<Users> findAll() {
		return userRepository.findAll();
	}

}
