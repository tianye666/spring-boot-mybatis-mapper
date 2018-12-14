package com.baizhi.dto;

import java.io.Serializable;
import java.util.List;

public class ListDto implements Serializable{
	private List<Integer> ids;

	public ListDto(List<Integer> ids) {
		super();
		this.ids = ids;
	}

	public ListDto() {
		super();
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	@Override
	public String toString() {
		return "ListDto [ids=" + ids + "]";
	}

	
}
