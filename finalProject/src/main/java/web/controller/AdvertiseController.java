package web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import web.dto.Advertise;
import web.dto.Band;
import web.dto.FindMember;
import web.dto.Member;
import web.dto.Part;
import web.service.face.AdvertiseService;
import web.utils.Paging;

@Controller
public class AdvertiseController {
	
	private transient Logger logger = LoggerFactory.getLogger(AdvertiseController.class);

	@Autowired AdvertiseService advertiseService;
	
	@RequestMapping(value="/advertise/list" , method=RequestMethod.GET)
	public void list( 
				Model model,
				@RequestParam(required=false , defaultValue="0") int curPage,
				@RequestParam(required=false , defaultValue="10") int listCount,
				@RequestParam(required=false , defaultValue="10") int pageCount,
				HttpServletRequest req 
				, String searchVal , String search , String searchTxt,
				HttpSession session
			) {
		
		Member member = (Member) session.getAttribute("loginInfo");
 
		searchVal =(req.getParameter("searchVal") == null ) ? "": req.getParameter("searchVal");
		
		searchTxt = req.getParameter("searchTxt");
		search = "";
		
		if(searchVal.equals("title")) {
			search = searchTxt;
			
		}
		else if (searchVal.equals("content")) {
			search = searchTxt;
		}
		else if(searchVal.equals("userId")) {
			search = searchTxt;
		}
		
		
		Paging paging = advertiseService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		paging.setSearch(search);
		paging.setSearchVal(searchVal);
		
		String adsNo = StringUtils.defaultIfEmpty(req.getParameter("adsNo"), "");
		
		logger.info(""+adsNo);
		
		int totalCount = advertiseService.selectAdvertiseCntAll();
		
		
		FindMember findMember = new FindMember();
		
		if(adsNo != null){
			paging.setAdsNo(adsNo);
		}else {
			paging.setAdsNo("");
		}
	
		
		model.addAttribute("member" , member);
		
		List<FindMember> list = advertiseService.getList(paging);
		model.addAttribute("list",list);
	
//		req.setAttribute("list", list);
		
		logger.info("구인구직 리스트");
		logger.info("구인구직 리스트");
	
		
	}
		@RequestMapping(value="/advertise/adscateCol" , method=RequestMethod.GET)
		public void adscateCol(Model model,HttpSession session,
				@RequestParam(required=false , defaultValue="0") int curPage,
				@RequestParam(required=false , defaultValue="10") int listCount,
				@RequestParam(required=false , defaultValue="10") int pageCount,
				HttpServletRequest req 
				, String searchVal , String search , String searchTxt
			) {
		Member member = (Member) session.getAttribute("loginInfo");
		searchVal =(req.getParameter("searchVal") == null ) ? "": req.getParameter("searchVal");
		
		searchTxt = req.getParameter("searchTxt");
		search = "";
		
		if(searchVal.equals("title")) {
			search = searchTxt;
			
		}
		else if (searchVal.equals("content")) {
			search = searchTxt;
		}
		else if(searchVal.equals("userId")) {
			search = searchTxt;
		}
		
		
		Paging paging = advertiseService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		paging.setSearch(search);
		paging.setSearchVal(searchVal);
		
		String adsNo = StringUtils.defaultIfEmpty(req.getParameter("adsNo"), "");
		
		logger.info(""+adsNo);
		
		int totalCount = advertiseService.selectAdvertiseCntAll();
		
		
		FindMember findMember = new FindMember();
		
		if(adsNo == "1"){
			paging.setAdsNo(adsNo);
		}else {
			paging.setAdsNo("2");
		}
	
		
		model.addAttribute("member" ,member);
		
		List<FindMember> list = advertiseService.getList(paging);
		model.addAttribute("list",list);
	
//		req.setAttribute("list", list);
		
		logger.info("구인구직 리스트");
		logger.info("구인구직 리스트");
			
		}
	
	
	
		@RequestMapping(value="/advertise/adscate" , method=RequestMethod.GET)
		public void adscate(			Model model,
				@RequestParam(required=false , defaultValue="0") int curPage,
				@RequestParam(required=false , defaultValue="10") int listCount,
				@RequestParam(required=false , defaultValue="10") int pageCount,
				HttpServletRequest req  , HttpSession session
				, String searchVal , String search , String searchTxt
			) {
			Member member = (Member) session.getAttribute("loginInfo");
		searchVal =(req.getParameter("searchVal") == null ) ? "": req.getParameter("searchVal");
		
		searchTxt = req.getParameter("searchTxt");
		search = "";
		
		if(searchVal.equals("title")) {
			search = searchTxt;
			
		}
		else if (searchVal.equals("content")) {
			search = searchTxt;
		}
		else if(searchVal.equals("userId")) {
			search = searchTxt;
		}
		
		
		Paging paging = advertiseService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		paging.setSearch(search);
		paging.setSearchVal(searchVal);
		
		String adsNo = StringUtils.defaultIfEmpty(req.getParameter("adsNo"), "");
		
		logger.info(""+adsNo);
		
		int totalCount = advertiseService.selectAdvertiseCntAll();
		
		
		FindMember findMember = new FindMember();
		
		if(adsNo != null){
			paging.setAdsNo(adsNo);
		}else {
			paging.setAdsNo("");
		}
	
		
		model.addAttribute("member" ,member);
		
		List<FindMember> list = advertiseService.getList(paging);
		model.addAttribute("list",list);
	
//		req.setAttribute("list", list);
		
		logger.info("구인구직 리스트");
		logger.info("구인구직 리스트");
		}
	
	@RequestMapping(value="/advertise/view" , method=RequestMethod.GET)
	public ModelAndView view(
			@RequestParam String findNo
			) {
		
		
		logger.info(""+findNo);
		
		Map map = advertiseService.view(findNo);
		
		ModelAndView mav = new ModelAndView();
		logger.info(map.toString());
//		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("jsonView");
		mav.addObject("map" , map);
		
		
		return mav;
	}

	@RequestMapping(value="/advertise/write" , method=RequestMethod.GET)
	public String write(HttpSession session , HttpServletRequest req) {
		logger.info("글쓰기 폼");
		
		Band band = (Band) session.getAttribute("bandInfo");
		
		
		req.setAttribute("band", band);
		
		return "/advertise/write";
	}
	@RequestMapping(value="/advertise/write" , method=RequestMethod.POST)
	public String writeProc(Advertise advertise  ) {
	
		advertiseService.write(advertise);
		
		return "redirect:/advertise/list";
	}
	@RequestMapping(value="/advertise/update" , method=RequestMethod.GET)
	public String update(HttpSession session , HttpServletRequest req , String findNo , Model model , HttpServletResponse resp ) {
		logger.info("글수정 폼");
		
//		Part part = advertiseService.getPart(positionNo);
//		req.setAttribute("part", part);
		Band band = (Band) session.getAttribute("bandInfo");
		model.addAttribute("band", band);
		
		if(band == null) {
			
			try {
				resp.sendRedirect("/advertise/list");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		FindMember advertise = advertiseService.viewAds(findNo);
		/*model.addAttribute("ads" ,advertise );*/
		req.setAttribute("ads", advertise);
		
	
		
		return "/advertise/update";
	}
	@RequestMapping(value="/advertise/update" , method=RequestMethod.POST)
	public String updateProc(Advertise advertise) {
		logger.info("글수정 처리");
		
		advertiseService.modify(advertise);
		
		return "redirect:/advertise/update";
	}
	@RequestMapping(value="/advertise/delete" , method=RequestMethod.GET)
	public String delete(String findNo , HttpSession session , HttpServletResponse resp) {
		
		Band band = (Band)session.getAttribute("bandInfo");
		
		if(band == null) {
			try {
				resp.sendRedirect("/advertise/list");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		advertiseService.delete(findNo);
		
		return "redirect:/advertise/list";
	}

	
}
