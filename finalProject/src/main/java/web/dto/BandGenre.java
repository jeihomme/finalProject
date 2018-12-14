package web.dto;

public class BandGenre {

	private String bandNo;
	private int genreNo;
	@Override
	public String toString() {
		return "BandGenre [bandNo=" + bandNo + ", genreNo=" + genreNo + "]";
	}
	public String getBandNo() {
		return bandNo;
	}
	public void setBandNo(String bandNo) {
		this.bandNo = bandNo;
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	
	
	
}
