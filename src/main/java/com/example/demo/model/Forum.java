package com.example.demo.model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.PrePersist;

@Entity
public class Forum {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String detail;
	private String author;
	private int love;
	private Date date;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getLove() {
		return love;
	}
	public void setLove(int love) {
		this.love = love;
	}

	 public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	 @PrePersist
	    public void onPrePersist() {
	        this.date = new Date(); // ตั้งค่า post_date เป็นเวลาปัจจุบัน
	    }

}