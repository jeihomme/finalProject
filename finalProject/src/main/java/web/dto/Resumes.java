package web.dto;

public class Resumes {
	private int resumesNo;
	private int publicResumes;
	private String resumesTitle;
	private int bandNo;
	private String bandInfo;
	private int musicNo;
	
	private String bandName;

	@Override
	public String toString() {
		return "Resumes [resumesNo=" + resumesNo + ", publicResumes=" + publicResumes + ", resumesTitle=" + resumesTitle
				+ ", bandNo=" + bandNo + ", bandInfo=" + bandInfo + ", musicNo=" + musicNo + ", bandName=" + bandName
				+ "]";
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

	public int getBandNo() {
		return bandNo;
	}

	public void setBandNo(int bandNo) {
		this.bandNo = bandNo;
	}

	public String getBandInfo() {
		return bandInfo;
	}

	public void setBandInfo(String bandInfo) {
		this.bandInfo = bandInfo;
	}

	public int getMusicNo() {
		return musicNo;
	}

	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}

	public String getBandName() {
		return bandName;
	}

	public void setBandName(String bandName) {
		this.bandName = bandName;
	}

}
