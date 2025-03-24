package com.example.demo.model;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public interface CommentInterfaceRepository extends CrudRepository<Comment, Integer>{
	 List<Comment> findByForumId(Integer forumId);
}
