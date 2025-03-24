package com.example.demo.model;

import org.springframework.data.repository.CrudRepository;
import java.util.List;


public interface ForumInterfaceRepository extends CrudRepository<Forum, Integer>{
	
	Forum findById(int id);

	List<Forum> findByDetailContainingOrAuthorContaining(String detail, String author);
}