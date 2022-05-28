package com.model2.mvc.service.domain;

import java.sql.Date;

public class Review {
	
	private int reviewNo;
	private String reviewText;
	private int reviewScore;
	private int prodNo;
	private String userId;
	private Date writeDate;
	
	public Review() {
	
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewText=" + reviewText + ", reviewScore=" + reviewScore
				+ ", prodNo=" + prodNo + ", userId=" + userId + ", writeDate=" + writeDate + "]";
	}
	
	
	
	
	
	

}
