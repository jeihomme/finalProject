package web.controller.band;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import web.dto.Band;
import web.service.face.BandService;

@Controller
public class BandController {

	@Autowired BandService bandService;
	
	// 전체 리스트
	public String bandList() {
		
		return null;
		
	}
	
	// 카테고리로 조회
	public String bandCategory(String cate) {
		
		return null;
		
	}
	
	// 밴드 소개 보기
	public String bandView(String bandName) {
		
		return null;
		
	}
	
	// 밴드 소개 수정 폼
	public void bandEdit() {
		
	}
	
	// 밴드 소개 수정 진행
	public String bandEditProc(Band band) {
		
		return null;
		
	}
	
	// 밴드 일정표
	public String bandSchedule(String bandName) {
		
		return null;
	}
	
}
