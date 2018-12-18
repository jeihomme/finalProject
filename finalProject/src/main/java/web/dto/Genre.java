package web.dto;

public class Genre {
	private int genreNo;
	private String genreTitle;
	
	@Override
	public String toString() {
		return "Genre [genreNo=" + genreNo + ", genreTitle=" + genreTitle + "]";
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	public String getGenreTitle() {
		return genreTitle;
	}
	public void setGenreTitle(String genreTitle) {
		this.genreTitle = genreTitle;
	}
	
	
}
