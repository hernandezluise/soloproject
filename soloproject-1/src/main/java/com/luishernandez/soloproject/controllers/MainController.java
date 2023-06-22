package com.luishernandez.soloproject.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.luishernandez.soloproject.models.JobPost;
import com.luishernandez.soloproject.models.User;
import com.luishernandez.soloproject.services.JobPostService;
import com.luishernandez.soloproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {

	@Autowired
	private UserService userService;
	@Autowired
	private JobPostService jobPostService;
	
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		Long userId =(Long) session.getAttribute("userId");
		if(userId == null) {
			return "redirect:/";
		}
		User user = userService.findById(userId);
		List<JobPost> jobPosts = jobPostService.allJobPosts();
		model.addAttribute("user", user);
		model.addAttribute("jobPosts", jobPosts);
		return "dashboard.jsp";
	}
	 // Create post
	   @GetMapping("/post/new")
	   public String newBook(@ModelAttribute("jobPosts") JobPost jobPost, HttpSession session) {
	   	Long userId =(Long) session.getAttribute("userId");
	   	if(userId == null) {
	   		return "redirect:/";
	   	}
		   return "newJobPost.jsp";
	   }
	   
		@PostMapping("/post")
		public String create(@Valid @ModelAttribute("jobPosts") JobPost jobPost, BindingResult result, HttpSession session) {
	    	Long userId =(Long) session.getAttribute("userId");
	    	if(userId == null) {
	    		return "redirect:/";
	    	}
			if (result.hasErrors()) {
				return "newJobPost.jsp";
			} else {
				User user = userService.findById(userId);
				jobPost.setUser(user);
				jobPostService.createJobPost(jobPost);
				System.out.println(userId);
				System.out.println(user.getId());
				return "redirect:/home";
			}
		}
		
		// edit
		@RequestMapping("/posts/{id}/edit")
		public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
	    	Long userId =(Long) session.getAttribute("userId");
	    	if(userId == null) {
	    		return "redirect:/";
	    	}
			JobPost jobPost = jobPostService.findJobPost(id);
			model.addAttribute("jobPosts", jobPost);
			return "edit.jsp";
		}
		
		// edit POST 
	    @RequestMapping(value="/posts/{id}", method=RequestMethod.PUT)
	    public String update(@Valid @ModelAttribute("jobPosts") JobPost jobPost, BindingResult result, Model model, @PathVariable("id") Long id, HttpSession session) {
	    	Long userId =(Long) session.getAttribute("userId");
	    	if(userId == null) {
	    		return "redirect:/";
	    	}
	    	if (result.hasErrors()) {
	            model.addAttribute("jobPosts", jobPost);
	            return "edit.jsp";
	        } else {
				
				User user = userService.findById(userId);
				jobPost.setUser(user);
	            jobPostService.updateJobPost(jobPost);
	            return "redirect:/home";
	        }
	    }
	    
	    // delete route
	    @RequestMapping(value="/jobposts/{id}", method=RequestMethod.DELETE)
	    
	    public String destroy(@PathVariable("id") Long id, HttpSession session) {   	
	    	Long userId =(Long) session.getAttribute("userId");
	    	if(userId == null) {
	    		return "redirect:/";
	    	}
	    	jobPostService.deleteJobPost(id);
	    	return "redirect:/home";
	    }
		// Shows individual psot
		@GetMapping("/post/{jobPostId}")
		public String index(Model model, @PathVariable("jobPostId") Long jobPostId, HttpSession session) {
	    	Long userId =(Long) session.getAttribute("userId");
	    	if(userId == null) {
	    		return "redirect:/";
	    	}
			JobPost jobPost = jobPostService.findJobPost(jobPostId);
	    	User user = userService.findById(userId);
			model.addAttribute("jobPosts", jobPostService.findJobPost(jobPostId));
	    	model.addAttribute("user", user);

			
			return "jobPostDetail.jsp";
		}

}
