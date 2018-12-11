package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import web.service.face.FAQAnsService;
import web.service.face.FAQService;

@Controller
public class FAQController {

	@Autowired FAQService faqService;
	@Autowired FAQAnsService faqAnsService;
}
