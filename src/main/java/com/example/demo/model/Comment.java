package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name; // ชื่อผู้แสดงความคิดเห็น
	private String text; // เนื้อหาคอมเมนต์
	
    @ManyToOne
    @JoinColumn(name = "forum_id") // ต้องชี้ไปที่ forum_id
    private Forum forum;

	// Getters and Setters
	public Integer getId() { return id; }
	public void setId(Integer id) { this.id = id; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getText() { return text; }
	public void setText(String text) { this.text = text; }
	
	public Forum getForum() { return forum; }
	public void setForum(Forum forum) { this.forum = forum; }
}

