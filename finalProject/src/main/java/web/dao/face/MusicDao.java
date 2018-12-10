package web.dao.face;

import web.dto.Music;

public interface MusicDao {

	// 밴드 소개 음악 가져오기
	public Music getMusic(String bandName);
	
}
