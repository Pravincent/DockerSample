package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.entity.User;

@Controller    
public class DockerController   
{    
	@RequestMapping("/index")    
	public String index()  
	{    
		System.out.println("inside index mapping");
		return "index";    
	}    
	@RequestMapping(value="/save", method=RequestMethod.POST)    
	public ModelAndView save(@ModelAttribute User user)  
	{    
		System.out.println("inside save mapping");
		ModelAndView modelAndView = new ModelAndView();    
		modelAndView.setViewName("user-data");        
		modelAndView.addObject("user", user);      
		return modelAndView;    
	}    
} 