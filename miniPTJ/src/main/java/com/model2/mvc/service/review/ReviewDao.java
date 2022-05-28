package com.model2.mvc.service.review;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Review;

public interface ReviewDao {

	public void addReview(Review review) throws Exception;
	
	public List<Review> getReviewList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public void updateReview(int reviewNo) throws Exception;
	
	public void delete(int reviewNo) throws Exception;
	
	

}
