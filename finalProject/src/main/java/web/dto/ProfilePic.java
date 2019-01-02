package web.dto;

public class ProfilePic {
	
	private int rnum;
	private int profileNo;
	private String path;
	private String originName;
	private String storedName;
	
	@Override
	public String toString() {
		return "ProfilePic [rnum=" + rnum + ", profileNo=" + profileNo + ", path=" + path + ", originName=" + originName
				+ ", storedName=" + storedName + "]";
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getProfileNo() {
		return profileNo;
	}
	public void setProfileNo(int profileNo) {
		this.profileNo = profileNo;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	
}
