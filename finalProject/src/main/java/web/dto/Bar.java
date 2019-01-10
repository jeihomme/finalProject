package web.dto;

public class Bar {
	private int barNo;
	private String barName;
	private String userId;
	private int profileNo;
	private String barInfo;
	private String manager;
	private int locationNo;
	private String locationName;
	private String barAddress;
	private int genreNo;
	private String path;
	private String originName;
	private String storedName;
	private String genreName;
	private int startNo;
	private int endNo;

	public int getBarNo() {
		return barNo;
	}

	public void setBarNo(int barNo) {
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

	public int getProfileNo() {
		return profileNo;
	}

	public void setProfileNo(int profileNo) {
		this.profileNo = profileNo;
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

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
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

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
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

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	@Override
	public String toString() {
		return "Bar [barNo=" + barNo + ", barName=" + barName + ", userId=" + userId + ", profileNo=" + profileNo
				+ ", barInfo=" + barInfo + ", manager=" + manager + ", locationNo=" + locationNo + ", locationName="
				+ locationName + ", barAddress=" + barAddress + ", genreNo=" + genreNo + ", path=" + path
				+ ", originName=" + originName + ", storedName=" + storedName + ", genreName=" + genreName
				+ ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}

}
