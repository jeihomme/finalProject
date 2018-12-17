package web.dto;

public class BandGenre {

	private int bandNo;
	private int genreNo;
	@Override
	public String toString() {
		return "BandGenre [bandNo=" + bandNo + ", genreNo=" + genreNo + "]";
	}
	public int getBandNo() {
		return bandNo;
	}
	public void setBandNo(int bandNo) {
		this.bandNo = bandNo;
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	
}
