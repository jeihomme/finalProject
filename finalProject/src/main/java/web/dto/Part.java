package web.dto;

public class Part {
	
	private String positionNo;
	private String pTitle;
	
	
	
	public String getPositionNo() {
		return positionNo;
	}
	public void setPositionNo(String positionNo) {
		this.positionNo = positionNo;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	@Override
	public String toString() {
		return "Part [positionNo=" + positionNo + ", pTitle=" + pTitle + "]";
	}
	
	
	
}
