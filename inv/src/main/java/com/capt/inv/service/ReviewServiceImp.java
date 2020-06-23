package com.capt.inv.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.capt.inv.model.Companies;
import com.capt.inv.model.Reviews;
import com.capt.inv.model.Users;
import com.capt.inv.repository.ReviewRepository;



@Service
@Transactional
public class ReviewServiceImp implements ReviewService {
	@Autowired
	private ReviewRepository reviewRepository;

	@Override
	public List<Reviews> searchReview(String keyword) {
		return reviewRepository.searchReview(keyword);
	}

	@Override
	public Optional<Reviews> findByReviewId(Long reviewId) {
		return reviewRepository.findByReviewId(reviewId);
	}

	@Override
	public void deleteReview(Long Id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void save(Reviews review) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void newReview(Long Id, Date date, String text, Companies company, Users user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateReview(Long Id, Date date, String text, Companies company, Users user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reviews> findAll() {
		return reviewRepository.findAll();
	}

	
	
}
