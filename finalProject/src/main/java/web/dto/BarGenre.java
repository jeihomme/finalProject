package web.dto;

public class BarGenre {
	
	private String barName;
	private int genreNo;

	public String getBarName() {
		return barName;
	}
	public void setBarName(String barName) {
		this.barName = barName;
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	
	@Override
	public String toString() {
		return "BarGame [barName=" + barName + ", genreNo=" + genreNo + "]";
	}
	
	

}
