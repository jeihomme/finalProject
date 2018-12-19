package web.dto;

public class Resumes {
	private int resumesNo;
	private int publicResumes;
	private String resumesTitle;
	private String bandNo;
	private String bandInfo;
	private int musicNo;
	@Override
	public String toString() {
		return "Resumes [resumesNo=" + resumesNo + ", publicResumes=" + publicResumes + ", resumesTitle=" + resumesTitle
				+ ", bandNo=" + bandNo + ", bandInfo=" + bandInfo + ", musicNo=" + musicNo + "]";
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
	public String getbandNo() {
		return bandNo;
	}
	public void setbandNo(String bandNo) {
		this.bandNo = bandNo;
	}
	public String getbandInfo() {
		return bandInfo;
	}
	public void setbandInfo(String bandInfo) {
		this.bandInfo = bandInfo;
	}
	public int getMusicNo() {
		return musicNo;
	}
	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}
	
	
}
