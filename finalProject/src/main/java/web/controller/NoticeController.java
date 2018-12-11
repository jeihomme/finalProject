package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import web.service.face.NoticeService;

@Controller
public class NoticeController {

	@Autowired NoticeService noticeService;
}
