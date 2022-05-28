package com.model2.mvc.service.review.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;
import com.model2.mvc.service.review.ReviewService;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	@Qualifier("reviewDaoImpl")
	private ReviewDao reviewDao;
	public void setReviewDao(ReviewDao reviewDao) {
		this.reviewDao = reviewDao;
	}
	
	public ReviewServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addReview(Review review) throws Exception {
		
		reviewDao.addReview(review);
		
	}

	@Override
	public Map<String, Object> getReviewList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReview(int reviewNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int reviewNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
