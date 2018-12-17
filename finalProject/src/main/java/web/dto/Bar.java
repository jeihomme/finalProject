package web.dto;

public class Bar {
	
	private String barNo;
	private String barName;
	private String userId;
	private String profileNo;
	private String contact;
	private String barInfo;
	private String manager;
	private String path;
	private String originName;
	private String storedName;
	private String locationNo;
	private String locationName;
	private String barAddress;
	private String genreNo;
	private String genreName;
	
	
	
	public String getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(String locationNo) {
		this.locationNo = locationNo;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getBarAddress() {
		return barAddress;
	}
	public void setBarAddress(String barAddress) {
		this.barAddress = barAddress;
	}
	public String getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(String genreNo) {
		this.genreNo = genreNo;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	public String getBarNo() {
		return barNo;
	}
	public void setBarNo(String barNo) {
		this.barNo = barNo;
	}
	public String getBarName() {
		return barName;
	}
	public void setBarName(String barName) {
		this.barName = barName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProfileNo() {
		return profileNo;
	}
	public void setProfileNo(String profileNo) {
		this.profileNo = profileNo;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getBarInfo() {
		return barInfo;
	}
	public void setBarInfo(String barInfo) {
		this.barInfo = barInfo;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
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
		return "Bar [barNo=" + barNo + ", barName=" + barName + ", userId=" + userId + ", profileNo=" + profileNo
				+ ", contact=" + contact + ", barInfo=" + barInfo + ", manager=" + manager + ", path=" + path
				+ ", originName=" + originName + ", storedName=" + storedName + ", locationNo=" + locationNo
				+ ", locationName=" + locationName + ", barAddress=" + barAddress + ", genreNo=" + genreNo
				+ ", genreName=" + genreName + "]";
	}
	
	

}
