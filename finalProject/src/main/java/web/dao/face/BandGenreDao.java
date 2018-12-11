package web.dao.face;

import java.util.List;

public interface BandGenreDao {

	//전체 조회
	public List selectAll();
	
	// 쓰기 
	public void insert();
	
	// 수정
	public void update();
	
	// 삭제
	public void delete();
}
