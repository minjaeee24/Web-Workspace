package com.kh.board.model.vo;

public class Category {
	
	private int categoryNo;
	private String catrgoryName;
	
	public Category() {
		
	}

	public Category(int categoryNo, String catrgoryName) {
		super();
		this.categoryNo = categoryNo;
		this.catrgoryName = catrgoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCatrgoryName() {
		return catrgoryName;
	}

	public void setCatrgoryName(String catrgoryName) {
		this.catrgoryName = catrgoryName;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", catrgoryName=" + catrgoryName + "]";
	}
	
	
}
