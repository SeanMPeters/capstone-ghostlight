package com.capt.inv.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.capt.inv.model.Companies;
import com.capt.inv.model.Reviews;
import com.capt.inv.model.Users;

public interface ReviewService {
	List<Reviews> searchReview(String keyword);
	Optional<Reviews> findByReviewId(Long reviewId);
	void deleteReview(Long Id);
	void save(Reviews review);
	void newReview(Long Id, Date date, String text, Companies company, Users user);
	void updateReview(Long Id, Date date, String text, Companies company, Users user);
	List<Reviews> findAll();
}