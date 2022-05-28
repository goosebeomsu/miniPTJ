package com.model2.mvc.service.review.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;

@Repository("reviewDaoImpl")
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	@Qualifier
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		
	}
	


	public ReviewDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addReview(Review review) throws Exception {
		System.out.println("Dao addReivew start");
		sqlSession.insert("ReviewMapper.addReview", review);
		
		System.out.println("Dao addReivew end");
		
	}

	@Override
	public List<Review> getReviewList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
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
