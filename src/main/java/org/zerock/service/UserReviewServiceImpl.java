  package org.zerock.service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.MemberVO;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.UserReviewFileVO;
import org.zerock.domain.UserReviewLikersVO;
import org.zerock.domain.UserReviewVO;
import org.zerock.mapper.UserReviewFileMapper;
import org.zerock.mapper.UserReviewLikeMapper;
import org.zerock.mapper.UserReviewMapper;
import org.zerock.mapper.UserReviewOrderByMapper;

import com.fasterxml.jackson.databind.deser.impl.CreatorCandidate.Param;

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
	private String bucketName2;
	private String profileName;
	private S3Client s3;
	
	public UserReviewServiceImpl() {
		this.bucketName2 = "swteam1";
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
	private UserReviewFileMapper fileMapper;
	
	@Setter(onMethod_ = @Autowired)
	private UserReviewLikeMapper likeMapper;
	
	@Setter(onMethod_ = @Autowired)
	private UserReviewOrderByMapper orderMapper;
	
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
	
	@Override
	public List<UserReviewVO> getAnnounceList(ReviewCriteria recri) {
		return reviewMapper.getAnnounceListWithPaging(recri);
	}
	
	// 리뷰 정렬 방식 
	@Override
	public List<UserReviewVO> getPopularList(ReviewCriteria recri) {
		log.info("###########################poppular list#####################################");
		return orderMapper.getPopularReviewList(recri);
	}
	
	@Override
	public List<UserReviewVO> getLatestList(ReviewCriteria recri) {
		log.info("###########################latest list#####################################");
		return orderMapper.getLatestReviewList(recri);
	}
	
	@Override
	public List<UserReviewVO> getviewCountList(ReviewCriteria recri) {
		log.info("###########################viewcount list#####################################");
		return orderMapper.getViewCountReviewList(recri);
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
				
				fileMapper.reviewFileInsert(ufvo);
				upload(review, file);
			}
		}
	}
	
	// 리뷰 이미지 파일 업로드
	private void upload(UserReviewVO review, MultipartFile file) {
		

			try (InputStream is = file.getInputStream()) {

				PutObjectRequest objectRequest = PutObjectRequest.builder()
						.bucket(bucketName2)
						.key("review" + "/" + review.getReBno() + "/" + file.getOriginalFilename())
						.contentType(file.getContentType())
						.acl(ObjectCannedACL.PUBLIC_READ)
						.build();

				s3.putObject(objectRequest, RequestBody.fromInputStream(file.getInputStream(), file.getSize()));

			} catch (Exception e) {
				throw new RuntimeException();
			}
	}
	
	// 리뷰 평점 얻어오기
	@Override
	public int getReviewStar(int reBno) {
		return reviewMapper.getReviewStar(reBno);
	}
	
	// 리뷰 게시물 상세
	@Override
	@Transactional
	public UserReviewVO reviewGet(int reBno) {
		reviewMapper.setViewCount(reBno);
		return reviewMapper.readReview(reBno);
	}
	
	// 특정 리뷰 게시물에 대한 좋아요 사용자 리스트
	@Override
	public List<UserReviewLikersVO> getLikersList(int reBno, String userid) {
		return likeMapper.getLikersPicked(reBno);
	}
	
	// 리뷰 좋아요 수 설정 및 얻기
	@Override
	@Transactional
		public int reviewLikecount(@RequestParam("reBno") int reBno, @RequestParam("userid") String userid) {
		
		// 좋아요를 누른 사용자 리스트 조회하고
		List<UserReviewLikersVO> likers = likeMapper.getLikersPicked(reBno);
		
		// 만약 내가 좋아요를 누른 사람 중에 없으면, 목록에 넣기
		for (UserReviewLikersVO userlikers : likers) {
			
			// 좋아요 수 늘리고
			if (userlikers.getUserid().equals(userid)) {
//				return likeMapper.getLikeCount(reBno);
				throw new RuntimeException("이미 추천하였습니다.");
			}
		}
		likeMapper.setLikeCount(reBno);
		likeMapper.insertLikers(reBno, userid);
		return likeMapper.getLikeCount(reBno);
		
	}

	// 리뷰 게시물 수정
	@Override
	public boolean reviewModify(UserReviewVO review) {
		return reviewMapper.updateReview(review) == 1;
	}
	
	// 리뷰 게시물 수정 (이미지 파일 수정 포함)
	@Override
	public boolean reviewModify(UserReviewVO review, MultipartFile[] mfile) {
		
		// 이전 파일 (S3) 삭제
		UserReviewVO oldReview = reviewMapper.readReview(review.getReBno());
		removeReviewFile(oldReview);
		
		fileMapper.deleteReviewByBno(review.getReBno());
		
		// 새로운 평점 등록
		
		// 새로운 파일 업로드
		if (mfile != null) {
			
			for (MultipartFile file : mfile) {
				
				if (file != null && file.getSize() > 0) {
					
					upload(review, file);
					
					UserReviewFileVO rfvo = new UserReviewFileVO();
					
					rfvo.setBno(review.getReBno());
					rfvo.setFileName(file.getOriginalFilename());
					
					fileMapper.reviewFileInsert(rfvo);
				}
			}
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
		fileMapper.deleteReviewByBno(reBno);
		
		// 게시물 삭제
		int cnt = reviewMapper.deleteReview(reBno);
		
		return cnt == 1; 
	}
 
	// 리뷰 이미지 파일 삭제
	private void removeReviewFile(UserReviewVO review) {
		log.info("working good");
		
		for (String file : review.getFileName()) {
			String key = "review" + "/" + review.getReBno()	+ "/" + file;
			
			log.info(key);
			
			DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
					.bucket(bucketName2)
					.key(key)
					.build();
			s3.deleteObject(deleteObjectRequest);
			
		}
		
	}
	
	
}
