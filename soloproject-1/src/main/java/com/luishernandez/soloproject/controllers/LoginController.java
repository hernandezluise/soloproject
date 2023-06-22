package com.luishernandez.soloproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.luishernandez.soloproject.models.LoginUser;
import com.luishernandez.soloproject.models.User;
import com.luishernandez.soloproject.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
//@RequestMapping("/users")
public class LoginController {
	   
	@Autowired
    private UserService userServ;
	   @GetMapping("/")
	   public String index(Model model, HttpSession session) {
		   

	       model.addAttribute("newUser", new User());
	       model.addAttribute("newLogin", new LoginUser());
	       return "index.jsp";
	   }
	   
	   @PostMapping("/register")
	   public String register(@Valid @ModelAttribute("newUser") User newUser, 
	           BindingResult result, Model model, HttpSession session) {
	       

		   User user = userServ.register(newUser, result);
	       
	       if(result.hasErrors()) {

	           model.addAttribute("newLogin", new LoginUser());
	           System.out.println("This confirms errors");
	           return "index.jsp";
	       }

	       session.setAttribute("userId", user.getId());
	       System.out.println("No Errors");
	       return "redirect:/home";
	   }
	   
	   @PostMapping("/login")
	   public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	           BindingResult result, Model model, HttpSession session) {

	        User user = userServ.login(newLogin, result);
	   
	       if(result.hasErrors()) {
	           model.addAttribute("newUser", new User());
	           return "index.jsp";
	       }
	   

	       session.setAttribute("userId", user.getId());
	   
	       return "redirect:/home";
	   }
	   
	   // log user out
	   @GetMapping("/logout")
	   public String logout(HttpSession session) {
	    Long userId =(Long) session.getAttribute("userId");
	    	if(userId == null) {
	    		return "redirect:/";
	    	}
	   	session.setAttribute("userId", null);
	   	return "redirect:/";
	   }
	   
}
