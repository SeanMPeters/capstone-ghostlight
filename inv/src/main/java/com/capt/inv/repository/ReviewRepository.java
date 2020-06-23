package com.capt.inv.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.capt.inv.model.Reviews;

@Repository
public interface ReviewRepository extends JpaRepository<Reviews, Long> {

	Optional<Reviews> findById(long Id);
	
	@Query("FROM Reviews WHERE reviewId=?1")
	List<Reviews> searchReview(String keyword);

	Optional<Reviews> findByReviewId(Long reviewId); 
	
	
}
