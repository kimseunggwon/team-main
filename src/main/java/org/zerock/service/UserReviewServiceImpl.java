package org.zerock.service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.UserReviewFileVO;
import org.zerock.domain.UserReviewVO;
import org.zerock.mapper.UserReviewFileMapper;
import org.zerock.mapper.UserReviewMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.profiles.ProfileFile;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
@Log4j
public class UserReviewServiceImpl implements UserReviewService {
	 
	// AWS related
	private String bucketName;
	private String profileName;
	private S3Client s3;
	
	public UserReviewServiceImpl() {
		this.bucketName = "swteam1";
		this.profileName= "swteam1";
		
		Path contentLocation = new File(System.getProperty("user.home") + "/.aws/credentials").toPath();
		ProfileFile pf = ProfileFile.builder()
				.content(contentLocation)
				.type(ProfileFile.Type.CREDENTIALS)
				.build();
		ProfileCredentialsProvider pcp = ProfileCredentialsProvider.builder()
				.profileFile(pf)
				.profileName(profileName)
				.build();
		
		this.s3 = S3Client.builder()
				.credentialsProvider(pcp)
				.build();
	}
	
	// Dependency Injection
	@Setter(onMethod_ = @Autowired)
	private UserReviewMapper reviewMapper;
	
	@Setter(onMethod_ = @Autowired)
	private UserReviewFileMapper reviewFileMapper;
	
	// 리뷰 게시물 총 개수
	@Override
	public int getReviewTotal(ReviewCriteria recri) {
		return reviewMapper.getReviewTotalCount(recri);
	}
	
	// 리뷰 게시물 목록 (페이지별)
	@Override
	public List<UserReviewVO> getReviewList(ReviewCriteria recri) {
		return reviewMapper.getReviewListWithPaging(recri);
	}

	// 리뷰 게시물 작성
	@Override
	public void reviewWrite(UserReviewVO review) {
		reviewMapper.insertReviewSelectkey(review);
	}
	
	// 리뷰 게시물 작성 (이미지 파일 업로드 포함)
	@Override
	@Transactional
	public void reviewWrite(UserReviewVO review, MultipartFile[] mfile) {
		
		reviewWrite(review);
		
		for (MultipartFile file : mfile) {
			
			if (file != null && file.getSize() > 0) {
				UserReviewFileVO ufvo = new UserReviewFileVO();
				ufvo.setBno(review.getReBno());
				ufvo.setFileName(file.getOriginalFilename());
				
				reviewFileMapper.reviewFileInsert(ufvo);
				upload(review, file);
			}
		}
	}
	
	// 리뷰 이미지 파일 업로드
	private void upload(UserReviewVO review, MultipartFile file) {
		try (InputStream is = file.getInputStream()) {
			
			PutObjectRequest objectRequest = PutObjectRequest.builder()
											 .bucket(bucketName)
											 .key("review" + "/" + review.getReBno() + "/" + file.getOriginalFilename())
											 .contentType(file.getContentType())
											 .acl(ObjectCannedACL.PUBLIC_READ)
											 .build();
			
			s3.putObject(objectRequest, RequestBody.fromInputStream(file.getInputStream(), file.getSize()));
			
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	
	// 리뷰 게시물 상세
	@Override
	@Transactional
	public UserReviewVO reviewGet(int reBno) {
		reviewMapper.setViewCount(reBno);
		return reviewMapper.readReview(reBno);
	}
	
	// 리뷰 좋아요 수
	@Override
	public int reviewLikecount(int reBno) {
		reviewMapper.setLikeCount(reBno);
		return reviewMapper.getLikeCount(reBno);
		
	}

	// 리뷰 게시물 수정
	@Override
	public boolean reviewModify(UserReviewVO review) {
		return reviewMapper.updateReview(review) == 1;
	}
	
	// 리뷰 게시물 수정 (이미지 파일 수정 포함)
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

	// 리뷰 게시물 삭제
	@Override
	public boolean reviewRemove(int reBno) {
		
		// 파일 삭제 (s3)
		UserReviewVO rvo = reviewMapper.readReview(reBno);
		removeReviewFile(rvo);
		
		// 파일 삭제 (DB)
		reviewFileMapper.deleteReviewByBno(reBno);
		
		// 게시물 삭제
		int cnt = reviewMapper.deleteReview(reBno);
		
		return cnt == 1;
	}
 
	// 리뷰 이미지 파일 삭제
	private void removeReviewFile(UserReviewVO review) {
		log.info("working good");
		String key = "review" + "/" + review.getReBno()	+ "/" + review.getFileName();
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
												  .bucket(bucketName)
												  .key(key)
												  .build();
		s3.deleteObject(deleteObjectRequest);
	}
	
	
}
