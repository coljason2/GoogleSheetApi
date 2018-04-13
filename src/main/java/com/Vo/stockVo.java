package com.Vo;

public class stockVo {
	private String name;
	private String id;
	private double targetPrice;
	private double nowPrice;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getTargetPrice() {
		return targetPrice;
	}

	public void setTargetPrice(double targetPrice) {
		this.targetPrice = targetPrice;
	}

	public double getNowPrice() {
		return nowPrice;
	}

	public void setNowPrice(double nowPrice) {
		this.nowPrice = nowPrice;
	}

	@Override
	public String toString() {
		return "stockVo [name=" + name + ", id=" + id + ", targetPrice=" + targetPrice + ", nowPrice=" + nowPrice + "]";
	}

}
