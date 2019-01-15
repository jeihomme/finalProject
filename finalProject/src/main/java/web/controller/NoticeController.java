package web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.Advertise;
import web.dto.Member;
import web.dto.Notice;
import web.service.face.NoticeService;
import web.utils.Paging;

@Controller
public class NoticeController {

	@Autowired NoticeService noticeService;

	private Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping(value="/notice/list" , method=RequestMethod.GET)
	public void list(
			@RequestParam(required=false , defaultValue="0") int curPage,
			@RequestParam(required=false , defaultValue="10") int listCount,
			@RequestParam(required=false , defaultValue="10") int pageCount,
			Model model,HttpServletRequest req, HttpSession session,
			String searchVal , String search ,	String searchTxt
			) {
		
		Member member = (Member)session.getAttribute("loginInfo");
		
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
	
		model.addAttribute("member" , member);

		Paging paging = noticeService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		paging.setSearch(search);
		paging.setSearchVal(searchVal);
		List<Notice> list = noticeService.getList(paging);
		model.addAttribute("list" , list);
		
		logger.info("공지사항 리스트");
		logger.info("리스트");
	}
	
	@RequestMapping(value="/notice/view" , method=RequestMethod.GET)
	public void view (Notice notice , Model model , int noticeNo) {
		
		noticeNo = notice.getNoticeNo();
		
		notice = noticeService.view(noticeNo);
		
		model.addAttribute("notice",notice);
		
		logger.info("상세보기");
		
	}
	

	@RequestMapping(value="/notice/write" , method=RequestMethod.GET)
	public String write(HttpSession session , Model model) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		model.addAttribute("member" , member);
		
		logger.info("글쓰기 폼");
		
		return "/notice/write";
	}
	
	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
	public String writeProc(Notice notice) {
		
		noticeService.write(notice);
		
		logger.info("글쓰기 처리");
		return "redirect:/notice/list";
	}
	@RequestMapping(value="/notice/update" , method=RequestMethod.GET)
	public void update(Notice notice, Model model , int noticeNo , HttpSession session , HttpServletResponse resp ) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		model.addAttribute("member" , member);
			

		noticeNo = notice.getNoticeNo();
		notice = noticeService.view(noticeNo);
		
		model.addAttribute("notice" ,notice);
		
		
		logger.info("수정하기 페이지");
	
		
	}
	
	@RequestMapping(value="/notice/update" , method=RequestMethod.POST)
	public String updateProc(Model model, Notice notice) {
		
		
		
		noticeService.modify(notice);
		
		logger.info("수정하기 처리");
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value="/notice/delete" , method=RequestMethod.GET)
	public String delete (
			
	int noticeNo , HttpSession session , Notice notice , Model model) {
		
		Member Member = (Member) session.getAttribute("loginInfo");
		
		model.addAttribute("Member" ,Member);
			
			noticeService.delete(noticeNo);
			
			return "redirect:/notice/list";
	
	
		
		
	}

}
