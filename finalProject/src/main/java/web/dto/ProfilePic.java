package web.dto;

public class ProfilePic {
	
	private int profileNo;
	private String path;
	private String originName;
	private String storedName;
	
	@Override
	public String toString() {
		return "ProfilePic [profileNo=" + profileNo + ", path=" + path + ", originName=" + originName + ", storedName="
				+ storedName + "]";
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
