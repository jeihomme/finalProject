package web.controller;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Band;
import web.dto.BandMember;
import web.service.face.BandService;
import web.utils.AddItems;

@Controller
public class BandController {

	private static final Logger logger = LoggerFactory.getLogger(BandController.class);
	@Autowired BandService bandService;
	
	private ModelAndView mav;
	private AddItems items;
	
	// 전체 리스트
	@RequestMapping(value="/band/bandList")
	public void bandList(
			String curPage,
			String genre,
			Model model) {
		
		logger.info("All List Connected"); logger.info("curPage = " + curPage);
		logger.info("genre : " + genre);
		Map map = bandService.getPrep(curPage);
		
		// 페이징처리처럼 작업
		items = new AddItems((int)map.get("totalCount"), (int)map.get("curPage"));
		
		List band = bandService.bandList(items, genre);
		List genres = bandService.genreList();
		List profile = bandService.getProPic(items, genre);
				
		model.addAttribute("total", map.get("totalCount"));
		model.addAttribute("band", band);
		model.addAttribute("genre", genres);
		model.addAttribute("profile", profile);
		
	}
	
	// 카테고리로 조회
	@RequestMapping(value="/band/bandByGenre", method=RequestMethod.GET)
	public ModelAndView bandCategory(
			String curPage,
			String genre,
			Model model) {
		
		logger.info("Band By Genre Connected");
		
		// Paging ready
		logger.info("curPage = " + curPage);
		Map map = bandService.getPrep(curPage);
		
		items = new AddItems((int)map.get("totalCount"), (int)map.get("curPage"));
		
		// getting Lists
		List band = bandService.bandCate(items, genre);
		List profile = bandService.ProPicByCate(items, genre);
				
		// ModelAndView 생성 후 ViewName 설정
		mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		// input Data
		mav.addObject("band", band);
//		mav.addObject("genre", genre);
		mav.addObject("profile", profile);
		
		return mav;
		
	}
	
	@RequestMapping(value="/band/addBand", method=RequestMethod.GET)
	public ModelAndView addItems(
			String curPage,
			String genre) {
		
		logger.info("addBand Connected");
		
		// Paging ready
		logger.info("curPage = " + curPage);
		Map map = bandService.getPrep(curPage);
		
		items = new AddItems((int)map.get("totalCount"), (int)map.get("curPage"));
		
		// getting Lists
		List band = bandService.bandList(items, genre);
		List profile = bandService.getProPic(items, genre);
				
		// ModelAndView 생성 후 ViewName 설정
		mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		// input Data
		mav.addObject("band", band);
		mav.addObject("profile", profile);
		
		return mav;
	}
	
	// 밴드 소개 보기
	@RequestMapping(value="/band/bandView", method=RequestMethod.GET)
	public void bandView(
			int bandNo,
			Model model) {
		
		logger.info("bandNo : " + bandNo);
		
		Map general = bandService.bandView(bandNo);
		
		model.addAttribute("general", general);
	}
	
	// 밴드 history 삭제
	@RequestMapping(value="/band/delHistory", method=RequestMethod.POST)
	public void delHistory(
			String codes,
			Writer out) {
		
		logger.info("codes: " + codes);
		
		bandService.delHistory(codes);
		
		try {
			out.write("{\"res\": true}" );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 밴드 멤버 삭제
	@RequestMapping(value="/band/delBMember", method=RequestMethod.POST)
	public void delBMember(
			String codes,
			Writer out) {
		
		logger.info("codes: " + codes);
		
		bandService.delBMember(codes);
		
		try {
			out.write("{\"res\": true}" );
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="/band/addMember", method=RequestMethod.POST)
	public void addMember(
			BandMember bMem
			) {
		
		logger.info(bMem.getBandMemName());
		logger.info(bMem.getmPosition());
//		logger.info(bMem.getBandNo());
		
		bandService.addBMember(bMem);
		
	}
	
	// 밴드 소개 수정 진행
	public String bandEditProc(Band band) {
		
		// 아직
		
		return null;
		
	}
	
	
	
}
