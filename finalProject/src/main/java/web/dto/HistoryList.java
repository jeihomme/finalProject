package web.dto;

import java.util.List;

public class HistoryList {
	private List<History> list;

	@Override
	public String toString() {
		return "HistoryList [list=" + list + "]";
	}

	public List<History> getList() {
		return list;
	}

	public void setList(List<History> list) {
		this.list = list;
	}
}