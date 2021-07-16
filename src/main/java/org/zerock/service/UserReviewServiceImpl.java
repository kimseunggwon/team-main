package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.UserReviewFileVO;
import org.zerock.domain.UserReviewVO;
import org.zerock.mapper.UserReviewFileMapper;
import org.zerock.mapper.UserReviewMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;

@Service
@AllArgsConstructor
@Log4j
public class UserReviewServiceImpl implements UserReviewService{

	private UserReviewMapper reviewMapper;
	private UserReviewFileMapper reviewFileMapper;
	
	@Override
	public int getReviewTotal(ReviewCriteria recri) {
		return reviewMapper.getReviewTotalCount(recri);
	}
	
	@Override
	public List<UserReviewVO> getReviewList(ReviewCriteria recri) {
		return reviewMapper.getReviewListWithPaging(recri);
	}

	@Override
	public void reviewWrite(UserReviewVO review) {
		reviewMapper.insertReviewSelectkey(review);
	}
	
	@Override
	@Transactional
	public void reviewWrite(UserReviewVO review, MultipartFile file) {
		
		reviewWrite(review);
		
		if (file != null && file.getSize() > 0) {
			UserReviewFileVO ufvo = new UserReviewFileVO();
			ufvo.setBno(review.getReBno());
			ufvo.setFileName(file.getOriginalFilename());
			
			reviewFileMapper.reviewFileInsert(ufvo);
			upload(review, file);
		}
	}

	private void upload(UserReviewVO review, MultipartFile file) {
		
	}
	
	@Override
	public UserReviewVO reviewGet(int reBno) {
		return reviewMapper.readReview(reBno);
	}

	@Override
	public boolean reviewModify(UserReviewVO review) {
		return reviewMapper.updateReview(review) == 1;
	}
	
	@Override
	public boolean reviewModify(UserReviewVO review, MultipartFile file) {
		
		if (file != null && file.getSize() > 0) {
			UserReviewVO oldReview = reviewMapper.readReview(review.getReBno());
			removeReviewFile(oldReview);
			upload(review, file);
			
			reviewFileMapper.deleteReviewByBno(review.getReBno());
			
			UserReviewFileVO rfvo = new UserReviewFileVO();
			
			rfvo.setBno(review.getReBno());
			rfvo.setFileName(file.getOriginalFilename());
			
			reviewFileMapper.reviewFileInsert(rfvo);
		}
		return reviewModify(review);
	}

	@Override
	public boolean reviewRemove(int reBno) {
		
		// 댓글 삭제
		
		// 파일 삭제 (s3)
		
		// 파일 삭제 (DB)
		reviewFileMapper.deleteReviewByBno(reBno);
		
		// 게시물 삭제
		int cnt = reviewMapper.deleteReview(reBno);
		
		return cnt == 1;
	}
 
	
	private void removeReviewFile(UserReviewVO review) {
		log.info("working good");
		/*
		String key = review.getReBno()	+ "/" + review.getFileName();
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
												  .bucket(bucketName)
												  .key(key)
												  .build();
		s3.deleteObject(deleteObjectRequest);
		*/
	}
	
	
}
