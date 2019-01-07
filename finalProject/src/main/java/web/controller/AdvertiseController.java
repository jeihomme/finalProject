package web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.dto.FindMember;
import web.service.face.AdvertiseService;
import web.utils.Paging;

@Controller
public class AdvertiseController {
	
	private Logger logger = LoggerFactory.getLogger(AdvertiseController.class);

	@Autowired AdvertiseService advertiseService;
	
	@RequestMapping(value="/advertise/list" , method=RequestMethod.GET)
	public String list(
				Model model,
				@RequestParam(required=false , defaultValue="0") int curPage,
				@RequestParam(required=false , defaultValue="10") int listCount,
				@RequestParam(required=false , defaultValue="10") int pageCount,
				HttpServletResponse response , HttpServletRequest req
			) {

		Paging paging = advertiseService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		
		String adsNo = StringUtils.defaultIfEmpty(req.getParameter("adsNo"), "");
		
		logger.info(""+adsNo);
		
		int totalCount = advertiseService.selectAdvertiseCntAll();
		
		FindMember findMember = new FindMember();
		
		if(adsNo != null){
			paging.setAdsNo(adsNo);
		}else {
			paging.setAdsNo("");
		}
	
		List<FindMember> list = advertiseService.getList(paging);
		model.addAttribute("list" ,list);
//		req.setAttribute("list", list);
		
		logger.info("구인구직 리스트");
		logger.info("구인구직 리스트");
		
		return "/advertise/list";
		
	}
	@RequestMapping(value="/advertise/list" , method=RequestMethod.POST)
	public  ModelAndView listInfo(Model model,
			@RequestParam(required=false , defaultValue="0") int curPage,
			@RequestParam(required=false , defaultValue="10") int listCount,
			@RequestParam(required=false , defaultValue="10") int pageCount,
			HttpServletResponse response , HttpServletRequest req) {
	
		Paging paging = advertiseService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		
		String adsNo = StringUtils.defaultIfEmpty(req.getParameter("adsNo"), "");
		
		logger.info(""+adsNo);
		
		int totalCount = advertiseService.selectAdvertiseCntAll();
		
		FindMember findMember = new FindMember();
		
		if(adsNo != null){
			paging.setAdsNo(adsNo);
		}else {
			paging.setAdsNo("");
		}
		
	
	
		List<FindMember> list = advertiseService.getList(paging);
//		model.addAttribute("list" ,list);
//		req.setAttribute("list", list);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		mav.addObject("list" , list);
		
		logger.info("구인구직 리스트");
		logger.info("구인구직 리스트");
		
		return mav;
		
	}
	@RequestMapping(value="/advertise/view" , method=RequestMethod.GET)
	public ModelAndView view(
				Model model , int findNo , FindMember findmember
			) {
		
		findNo = findmember.getFindNo();
		findmember = advertiseService.view(findNo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		mav.addObject("findNo" , findNo);
		
		return mav;
	}
	
	public void write() {
		logger.info("글쓰기 폼");
		
	}
	
	public String writeProc() {
		logger.info("글쓰기 처리");
		
		return null;
	}
	
	public void update() {
		logger.info("글수정 폼");
	}
	
	public String updateProc() {
		logger.info("글수정 처리");
		
		return null;
	}
	
	public void delete() {
		
	}
	
	
}
