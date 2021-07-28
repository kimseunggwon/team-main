package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.HelpVO;
import org.zerock.domain.Pagenation;

public interface HelpService {
	
	public void register(HelpVO help);
	
	public HelpVO askGet(Long help);
	
	public boolean modify(HelpVO help);
	
	public boolean remove(Long help);
	
	public List<HelpVO> getList(Pagenation pag);
	
	public int getTotal(Pagenation pag);
	
	public void register(HelpVO help, MultipartFile[] file);
	
	public boolean modify(HelpVO help, MultipartFile[] file);
}
