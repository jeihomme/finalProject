package web.dto;

public class BandMember {
	private int bandMemberNo;
	private String bandMemName;
	private String bandName;
	private String bandMemInfo;
	@Override
	public String toString() {
		return "BandMember [bandMemberNo=" + bandMemberNo + ", bandMemName=" + bandMemName + ", bandName=" + bandName
				+ ", bandMemInfo=" + bandMemInfo + "]";
	}
	public int getBandMemberNo() {
		return bandMemberNo;
	}
	public void setBandMemberNo(int bandMemberNo) {
		this.bandMemberNo = bandMemberNo;
	}
	public String getBandMemName() {
		return bandMemName;
	}
	public void setBandMemName(String bandMemName) {
		this.bandMemName = bandMemName;
	}
	public String getBandName() {
		return bandName;
	}
	public void setBandName(String bandName) {
		this.bandName = bandName;
	}
	public String getBandMemInfo() {
		return bandMemInfo;
	}
	public void setBandMemInfo(String bandMemInfo) {
		this.bandMemInfo = bandMemInfo;
	}
	
	
}
