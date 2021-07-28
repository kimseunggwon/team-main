package org.zerock.service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AddressVO;
import org.zerock.domain.B2bIntroduceVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.SubscribeViewVO;
import org.zerock.domain.SubscriberInfoVO;
import org.zerock.domain.UserReviewVO;
import org.zerock.mapper.WonhyeokMapper;

import lombok.Setter;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.profiles.ProfileFile;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class WonhyeokRestServiceImpl implements WonhyeokRestService {
	
	// AWS related
		private String bucketName;
		private String profileName;
		private S3Client s3;
		
		public WonhyeokRestServiceImpl() {
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
	
	
	@Setter(onMethod_ =@Autowired)
	private WonhyeokMapper mapper;


	@Override
	public List<AddressVO> getsearchbystorename(String storename) {

		return mapper.getsearchbystorename(storename);
	}


	@Override
	public List<AddressVO> getlatlag(AddressVO vo) {
		
		return mapper.getSearchArroundPlaces(vo);
	}
	
	@Override
	public Integer getid(B2bIntroduceVO introduce) {
		
		return mapper.getid(introduce);
	}
	
	
	@Override
	public void B2bIntroduceRegister(B2bIntroduceVO introduce, MultipartFile file) {

		mapper.B2bIntroduceRegister(introduce);
		upload(introduce,file);
		
	}
	private void upload(B2bIntroduceVO introduce, MultipartFile file) {
		try (InputStream is = file.getInputStream()){
				
				// aws로 Upload 시켜주는 역할 
				PutObjectRequest objectRequest = PutObjectRequest.builder()
								.bucket(bucketName)
								// 번호별 폴더 안에 파일을 저장시켜서 중복되는걸 막음 : file의 key값에 board.Bno 값을 넣어 key를 바꿔줌 
								// key: 파일이 저장될 위치
								.key("storeIntroduceImg" + "/" + introduce.getId() + "/" + file.getOriginalFilename())
								.contentType(file.getContentType())
								.acl(ObjectCannedACL.PUBLIC_READ)
								.build();
				
				s3.putObject(objectRequest, RequestBody.fromInputStream(file.getInputStream(), file.getSize()));
	} catch (Exception e) {
		throw new RuntimeException(e);
	}
}


	@Override
	public void B2bIntroduceModify(B2bIntroduceVO introduce, MultipartFile file) {
	// aws s3 삭제 후 재업로드
		// 이전 정보 갖고 오기
		B2bIntroduceVO oldIntroduce = mapper.read(introduce.getId());
		//이전 정보 지우기
		removeIntroduceFile(oldIntroduce);
		// 재업로드
		upload(introduce, file);
	// DB 삭제 후 재 업로드
		mapper.deleteById(introduce.getId());
		
		mapper.B2bIntroduceRegister(introduce);
		
	}
	
	private void removeIntroduceFile(B2bIntroduceVO introduce) {
		String key = "storeIntroduceImg" + "/" + introduce.getId() + "/" + introduce.getFileName();
		
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
												  .bucket(bucketName)
												  .key(key)
												  .build();
		s3.deleteObject(deleteObjectRequest);
	}


	@Override
	public List<SubscribeViewVO> getNearStireInfo(MemberVO vo) {

		return mapper.getNearStoreInfo(vo);
	}


	@Override
	public void SaveSubscriberInfo(SubscriberInfoVO info) {
		mapper.SaveSubscriberInfo(info);
		
	}


	@Override
	public List<SubscribeViewVO> getStoreList() {
		
		return mapper.getStoreList();
	}


	


}
