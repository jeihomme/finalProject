package web.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
			Model model
			) {
		Paging paging = noticeService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		
		List<Notice> list = noticeService.getList(paging);
		model.addAttribute("list" , list);
		
		logger.info("공지사항 리스트");
	}
	
	@RequestMapping(value="/notice/view" , method=RequestMethod.GET)
	public void view(Model model , Notice notice , int noticeNo) {
		
		noticeNo = notice.getNoticeNo();
		
		notice = noticeService.view(noticeNo);
		
		model.addAttribute("notice" , notice);
		
		
		logger.info("상세보기 폼");
	}
	
	@RequestMapping(value="/notice/write" , method=RequestMethod.GET)
	public String write() {
		
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
	public String update() {
		
		logger.info("수정하기 페이지");
		
		return "/notice/update";
	}
	
	@RequestMapping(value="/notice/update" , method=RequestMethod.POST)
	public String updateProc(Notice notice, Model model , int noticeNo) {
		
		noticeNo = notice.getNoticeNo();
		notice = noticeService.view(noticeNo);
		
		model.addAttribute("notice" ,notice);
		
		return "redirect:/notice/list";
	}
}
