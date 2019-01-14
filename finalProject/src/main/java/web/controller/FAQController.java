package web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.FAQ;
import web.dto.Member;
import web.service.face.FAQService;
import web.utils.Paging;

@Controller
public class FAQController {

	@Autowired FAQService faqService;
	
	private Logger logger = LoggerFactory.getLogger(FAQController.class);
	
	
	@RequestMapping(value="/faq/list" , method=RequestMethod.GET)
	public void list(
					@RequestParam(required=false , defaultValue="0") int curPage,
					@RequestParam(required=false , defaultValue="10") int listCount,
					@RequestParam(required=false , defaultValue="10") int pageCount,
					Model model
			 ){
		
		Paging paging = faqService.getPaging(curPage, listCount, pageCount);
		model.addAttribute("paging" , paging);
		
		List<FAQ> list = faqService.getList(paging);
		model.addAttribute("list",list);
		
		
		logger.info("FQA 리스트");
	}
	
	
	@RequestMapping(value="/faq/write" , method=RequestMethod.GET)
	public void write(Model model , HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		model.addAttribute("member" , member);
		
		logger.info("글쓰기 폼");
		
	}
	
	@RequestMapping(value="/faq/write" , method=RequestMethod.POST)
	public String writeProc(FAQ faq) {
		
		
		faqService.write(faq);
		
		logger.info("글쓰기 처리");
		
		return "redirect:/faq/list";
	}
	
	@RequestMapping(value="/faq/update" , method=RequestMethod.GET)
	public void update(
				int faqNo,
				Model model,
				HttpSession session
			) {
		
		Member member = (Member) session.getAttribute("loginInfo");
		model.addAttribute("member" , member);
		
		FAQ faq = faqService.view(faqNo);
		model.addAttribute("faq" ,faq);
		
		logger.info("글수정 폼");
		
	}
	@RequestMapping(value="/faq/update" , method=RequestMethod.POST)
	public String updateProc(
					FAQ faq
			) {
		
		faqService.modify(faq);
		
		
		return "redirect:/faq/list";
		
	}
	@RequestMapping(value="/faq/delete" , method=RequestMethod.GET)
	public String delete(int faqNo) {
		faqService.delete(faqNo);
		
		return "redirect:/faq/list";
	}
	
	
}
