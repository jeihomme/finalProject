package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Band;
import web.service.face.BandService;

@Controller
public class BandController {

	private static final Logger logger = LoggerFactory.getLogger(BandController.class);
	@Autowired BandService bandService;
	
	// 전체 리스트
	@RequestMapping(value="/band/bandList")
	public void bandList(
			Model model) {
		logger.info("연결됐다");
		
		List band = bandService.bandList();
		List genre = bandService.genreList();
		List profile = bandService.getProPic();
		
		model.addAttribute("band", band);
		model.addAttribute("genre", genre);
		model.addAttribute("profile", profile);
		
	}
	
	// 카테고리로 조회
	public String bandCategory(String cate) {
		
		return null;
		
	}
	
	// 밴드 소개 보기
	public String bandView(String bandName) {
		
		return null;
		
	}
	
	// 밴드 소개 수정 폼
	public void bandEdit() {
		
	}
	
	// 밴드 소개 수정 진행
	public String bandEditProc(Band band) {
		
		return null;
		
	}
	
	// 밴드 일정표
	public String bandSchedule(String bandName) {
		
		return null;
	}
	
}
