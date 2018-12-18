package web.dto;

public class Genre {
	private int genreNo;
	private String genreName;
	@Override
	public String toString() {
		return "Genre [genreNo=" + genreNo + ", genreName=" + genreName + "]";
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	
	
	
}
