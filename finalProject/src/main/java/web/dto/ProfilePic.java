package web.dto;

public class ProfilePic {
	
	private String profileNo;
	private String path;
	private String originName;
	private String storedName;
	
	public String getProfileNo() {
		return profileNo;
	}
	public void setProfileNo(String profileNo) {
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
	
	@Override
	public String toString() {
		return "ProfilePic [profileNo=" + profileNo + ", path=" + path + ", originName=" + originName + ", storedName="
				+ storedName + "]";
	}
	
	
}
