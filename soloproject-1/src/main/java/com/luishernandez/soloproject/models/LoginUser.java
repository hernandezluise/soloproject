package com.luishernandez.soloproject.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class LoginUser {
	
    @NotEmpty
    @Email(message="Please enter a valid email!")
    private String email;
    
    
    @NotEmpty
    @Size(min=0, max=128, message="Incorrect password")
    private String password;
    
    public LoginUser() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}