package web.dto;

public class Advertise {

	private String bandName;

	private int findNo;
	private int adsNo;
	
	
	@Override
	public String toString() {
		return "Advertise [bandName=" + bandName + ", findNo=" + findNo + ", adsNo=" + adsNo + "]";
	}


	public String getBandName() {
		return bandName;
	}


	public void setBandName(String bandName) {
		this.bandName = bandName;
	}


	public int getFindNo() {
		return findNo;
	}


	public void setFindNo(int findNo) {
		this.findNo = findNo;
	}


	public int getAdsNo() {
		return adsNo;
	}


	public void setAdsNo(int adsNo) {
		this.adsNo = adsNo;
	}
	
	
	
	
	
	
	
}
