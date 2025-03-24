package com.example.demo;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Comment;
import com.example.demo.model.CommentInterfaceRepository;
import com.example.demo.model.Forum;
import com.example.demo.model.ForumInterfaceRepository;



@Controller
public class ForumController {
	@Autowired
	ForumInterfaceRepository repo;
	@Autowired
	CommentInterfaceRepository commentRepo; // เพิ่ม Repository ของ Comment
	
	@GetMapping("/forum")
	public String getForumList(Model model) {
	    List<Forum> forumList = (List<Forum>) repo.findAll();
	    List<Comment> commentList = (List<Comment>) commentRepo.findAll();

	    // นับคอมเมนต์ของแต่ละโพสต์
	    Map<Integer, Long> commentCountMap = commentList.stream()
	        .collect(Collectors.groupingBy(comment -> comment.getForum().getId(), Collectors.counting()));

	    model.addAttribute("allForums", forumList);
	    model.addAttribute("commentCountMap", commentCountMap);
	    return "/forum-table";
	}

	
	@GetMapping("/forumDetail/{id}")
	public String getForumDetailById(@PathVariable Integer id, Model model) {
	    Forum forum = repo.findById(id).orElse(null);
	    
	    if (forum != null) {
	        List<Comment> comments = forum.getComments();
	        model.addAttribute("forum", forum);
	        model.addAttribute("comments", comments);
	        
	        return "/forum-detail";
	    }
	    return "redirect:/forum";
	}


	@GetMapping("/searchForum")
	public String searchForum(@RequestParam("keyword") String keyword, Model model) {
	    List<Forum> searchResults;
	    
	    // ถ้าคีย์เวิร์ดว่างเปล่า ให้แสดงทั้งหมด
	    if (keyword == null || keyword.trim().isEmpty()) {
	        searchResults = (List<Forum>) repo.findAll();
	    } else {
	        // ค้นหาจาก detail หรือ author
	        // ตรงนี้คุณต้องสร้าง method ใน repository
	        searchResults = repo.findByDetailContainingOrAuthorContaining(keyword, keyword);
	    }
	    
	    model.addAttribute("allForums", searchResults);
	    return "/forum-table";
	}
	
	@GetMapping("/insertForum")
	public String insertForum(@RequestParam("detail") String detail, 
	                           @RequestParam("author") String author) {
		Forum forum = new Forum();
		forum.setDetail(detail);
		forum.setAuthor(author);
		forum.setLove(0); // Initialize love count to 0
		repo.save(forum);
		return "redirect:/forum"; // Redirect back to forum list
	}
	
	@GetMapping("/loveAdd/{id}")
	public String addLove(@PathVariable Integer id) {
		Forum forum = repo.findById(id).orElse(null);
		if (forum != null) {
			forum.setLove(forum.getLove() + 1);
			repo.save(forum);
		}
		return "redirect:/forum"; // Redirect back to forum list
	}
	
	// Optional: You might want to add a method to delete a forum post
	@GetMapping("/deleteForum/{id}")
	public String deleteForum(@PathVariable Integer id) {
		repo.deleteById(id);
		return "redirect:/forum";
	}
	
	// Optional: You might want to add a method to edit a forum post
	@GetMapping("/editForum/{id}")
	public String showEditForm(@PathVariable Integer id, Model model) {
		Forum forum = repo.findById(id).orElse(null);
		if (forum != null) {
			model.addAttribute("forum", forum);
			return "/update-form"; // Return edit form view
		}
		return "redirect:/forum";
	}
	
	@PostMapping("/updateForum")
	public String updateForum(@ModelAttribute Forum forum) {
		Forum existingForum = repo.findById(forum.getId()).orElse(null);
		if (existingForum != null) {
			existingForum.setDetail(forum.getDetail());
			existingForum.setAuthor(forum.getAuthor());
			repo.save(existingForum);
		}
		return "redirect:/forum";
	}
	
	

	@PostMapping("/addComment/{forumId}")
	public String addComment(@PathVariable Integer forumId, 
	                         @RequestParam("name") String name, 
	                         @RequestParam("text") String text) {
		Forum forum = repo.findById(forumId).orElse(null);
		if (forum != null) {
			Comment comment = new Comment();
			comment.setForum(forum);
			comment.setName(name);
			comment.setText(text);
			commentRepo.save(comment);
		}
		return "redirect:/forumDetail/" + forumId;
	}

}