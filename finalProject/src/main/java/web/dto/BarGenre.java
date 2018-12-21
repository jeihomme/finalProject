package web.dto;

public class BarGenre {
	
	private String barName;
	private String genreNo;
	@Override
	public String toString() {
		return "BarGenre [barName=" + barName + ", genreNo=" + genreNo + "]";
	}
	public String getBarName() {
		return barName;
	}
	public void setBarName(String barName) {
		this.barName = barName;
	}
	public String getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(String genreNo) {
		this.genreNo = genreNo;
	}
	

}
