package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import web.service.face.AdvertiseService;

@Controller
public class AdvertiseController {

	@Autowired AdvertiseService advertiseSerivce;
	
}
