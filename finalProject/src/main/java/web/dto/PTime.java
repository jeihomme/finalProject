package web.dto;

public class PTime {
	private String timeId;
	private String hourM;
	
	@Override
	public String toString() {
		return "PTime [timeId=" + timeId + ", hourM=" + hourM + "]";
	}
	public String getTimeId() {
		return timeId;
	}
	public void setTimeId(String timeId) {
		this.timeId = timeId;
	}
	public String gethourM() {
		return hourM;
	}
	public void sethourM(String hourM) {
		this.hourM = hourM;
	}
	
}
