package web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import web.dto.FAQ;
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
	
	@RequestMapping(value="/faq/view" , method=RequestMethod.GET)
	public void view(FAQ faq , Model model , int faqNo) {
		
		faqNo = faq.getFaqNo();
		faq = faqService.view(faqNo);
		
		model.addAttribute("faq" , faq);
		
		logger.info("상세보기");
	}
	
	@RequestMapping(value="/faq/write" , method=RequestMethod.GET)
	public String write() {
		
		logger.info("글쓰기 폼");
		
		return "/faq/write";
	}
	
	@RequestMapping(value="/faq/write" , method=RequestMethod.POST)
	public String writeProc(FAQ faq) {
		
		
		faqService.write(faq);
		
		logger.info("글쓰기 처리");
		
		return "redirect:/faq/list";
	}
	
}
