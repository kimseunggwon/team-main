package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.zerock.mapper.HelpMapper;

import lombok.Setter;
import software.amazon.awssdk.services.s3.S3Client;

public class HelpServiceImpl implements HelpService {
	
	private String bucketName;
	private String profileName;
	private S3Client s3;
	
	@Setter (onMethod_ = @Autowired)
	private HelpMapper mapper;
	
	
	
}
