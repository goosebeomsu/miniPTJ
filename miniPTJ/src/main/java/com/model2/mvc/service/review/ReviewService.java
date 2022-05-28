package com.model2.mvc.service.review;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Review;

public interface ReviewService {
	
	public void addReview(Review review) throws Exception;
	
	public Map<String, Object> getReviewList(Search search) throws Exception;
	
	public void updateReview(int reviewNo) throws Exception;
	
	public void delete(int reviewNo) throws Exception; 

}
