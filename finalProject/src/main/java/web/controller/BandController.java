package web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
		
//		logger.info("bandNo : " + band.get(0));
		
		model.addAttribute("band", band);
		model.addAttribute("genre", genre);
		model.addAttribute("profile", profile);
		
	}
	
	// 카테고리로 조회
	@RequestMapping(value="/band/bandByGenre", method=RequestMethod.GET)
	public ModelAndView bandCategory(
			String genre) {
		
		logger.info("ajax 요청 옴");
		logger.info(genre);
		
		// ModelAndView 생성 후 ViewName 설정
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		// 밴드, 프로파일사진 리스트 만들기
		List band = bandService.bandCate(genre);
		List profile = bandService.ProPicByCate(genre);
				
		// map 생성
		Map map = new HashMap();
		
		// map에 입력
		map.put("band", band);
		map.put("profile", profile);
		
		// mav에 입력
		mav.addObject(map);
		
//		logger.info("---- mav 출력 ----");
//		logger.info(mav.getModel().toString());
//		
//		logger.info("---- map 출력 ----");
////		logger.info(map.toString());
		
		return mav;
		
	}
	
	// 밴드 소개 보기
	@RequestMapping(value="/band/bandView", method=RequestMethod.GET)
	public void bandView(
			int bandNo,
			Model model) {
		
		logger.info("bandNo : " + bandNo);
		
		Map band = bandService.bandView(bandNo);
		List profile = bandService.getProPic();
		
		model.addAttribute("band", band);
		model.addAttribute("profile", profile);
		
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
