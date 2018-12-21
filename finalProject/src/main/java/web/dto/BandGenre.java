package web.dto;

public class BandGenre {

	private int bandNo;
	private int genreNo;
	private int resumesNo;
	@Override
	public String toString() {
		return "BandGenre [bandNo=" + bandNo + ", genreNo=" + genreNo + ", resumesNo=" + resumesNo + "]";
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
	public int getResumesNo() {
		return resumesNo;
	}
	public void setResumesNo(int resumesNo) {
		this.resumesNo = resumesNo;
	}
}
