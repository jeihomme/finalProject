package web.dto;

public class Resumes {
	private int resumesNo;
	private int publicResumes;
	private String resumesTitle;
	private String bandName;
	private String BandInfo;
	private int musicNo;
	@Override
	public String toString() {
		return "Resumes [resumesNo=" + resumesNo + ", publicResumes=" + publicResumes + ", resumesTitle=" + resumesTitle
				+ ", bandName=" + bandName + ", BandInfo=" + BandInfo + ", musicNo=" + musicNo + "]";
	}
	public int getResumesNo() {
		return resumesNo;
	}
	public void setResumesNo(int resumesNo) {
		this.resumesNo = resumesNo;
	}
	public int getPublicResumes() {
		return publicResumes;
	}
	public void setPublicResumes(int publicResumes) {
		this.publicResumes = publicResumes;
	}
	public String getResumesTitle() {
		return resumesTitle;
	}
	public void setResumesTitle(String resumesTitle) {
		this.resumesTitle = resumesTitle;
	}
	public String getBandName() {
		return bandName;
	}
	public void setBandName(String bandName) {
		this.bandName = bandName;
	}
	public String getBandInfo() {
		return BandInfo;
	}
	public void setBandInfo(String bandInfo) {
		BandInfo = bandInfo;
	}
	public int getMusicNo() {
		return musicNo;
	}
	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}
	
	
}
