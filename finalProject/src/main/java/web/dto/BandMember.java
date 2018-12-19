package web.dto;

public class BandMember {
	private int bandMemberNo;
	private String bandMemName;
	private int bandNo;
	private String mPosition;
	
	@Override
	public String toString() {
		return "BandMember [bandMemberNo=" + bandMemberNo + ", bandMemName=" + bandMemName + ", bandNo=" + bandNo
				+ ", mPosition=" + mPosition + "]";
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
	public int getBandNo() {
		return bandNo;
	}
	public void setBandNo(int bandNo) {
		this.bandNo = bandNo;
	}
	public String getmPosition() {
		return mPosition;
	}
	public void setmPosition(String mPosition) {
		this.mPosition = mPosition;
	}
	
}
