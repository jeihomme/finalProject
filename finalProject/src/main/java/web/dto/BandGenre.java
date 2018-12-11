package web.dto;

public class BandGenre {

	private String bandName;
	private int genreNo;
	
	
	public String getBandName() {
		return bandName;
	}
	public void setBandName(String bandName) {
		this.bandName = bandName;
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	@Override
	public String toString() {
		return "BandGenre [bandName=" + bandName + ", genreNo=" + genreNo + "]";
	}
	
	
}
