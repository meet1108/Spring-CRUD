package com.springCrud.Controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;


import com.springCrud.Modal.Users;
import com.springCrud.Service.RegisterServiceImpl;


//,"showAllUsers"
@SessionAttributes("users")
@Controller
public class RegisterController {

	private final RegisterServiceImpl registerService;

	public RegisterController(RegisterServiceImpl registerService) {
		this.registerService = registerService;
	}
		
	
	//Starting Page
	@GetMapping("/")
	public String home() {
		return "Login";
	}

	
	//Open Registration Page
	@GetMapping("/Register")
	public String register() {
		return "Register";
	}
	
	//Open login Page
	@GetMapping("/Login")
	public String login() {
		return "Login";
	}

	//Open Profile Page
	@GetMapping("/Profile")
	public String profilePage() {
		
		return "Profile";
	}
	
	
//	//Retrieve Data From Jsp Page
//	@PostMapping("/Register")
//	public String addUser(@RequestBody Map<String,String> data) {
//		
//		
//		
//		return "Login";
//	}
//	@PostMapping("/Register")
//	public String addUser(@ModelAttribute("users") Users users,
//			@RequestParam("image") MultipartFile image){
//		
//		try {
//			byte[] imageData = image.getBytes();
//            users.setImage(imageData);
//			 
//            System.out.println(users.getFirstName());
//            System.out.println(users.getImage());
//            //registerService.processUserData(users);
//		
//            return "redirect:Login";
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "redirect:Register";
//		}
//	}
	
	
	
	
	
	@PostMapping("/Register")
	public String addUser(@RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("mobileNumber") String mobileNumber,
            @RequestParam("dob") String dob,
            @RequestParam("gender") String gender,
            @RequestParam("title") String title,
            @RequestParam("langauge") String langauge,
            @RequestParam("country") String country,
            @RequestParam("hobby") String hobby,
            @RequestParam("image") MultipartFile image){
		
		try {
			byte[] imageData = image.getBytes();
			Users users = new Users();
            users.setFirstName(firstName);
            users.setLastName(lastName);
            users.setEmail(email);
            users.setPassword(password);
            users.setMobileNumber(mobileNumber);
            users.setDob(dob);
            users.setGender(gender);
            users.setTitle(title);
            users.setLangauge(langauge);
            users.setCountry(country);
            users.setHobby(hobby);
            users.setImage(imageData);
			 
            if(registerService.checkByEmail(email)) {
            	
            	registerService.processUserData(users);
            	return "redirect:Login";
            }else {
            	System.out.println("Email alreay exists");
            	return "Register";
            	
            }
			
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:Register";
		}
	}

	
	
	//Login, and check Login is Admin or User 
	@PostMapping("/Login")
	public String loginUser(@RequestParam("email") String email,
            @RequestParam("password") String password,Model model) {		 
		
		Users users= registerService.processLogin(email,password);
		
		if (users != null) {
			if(users.getRole()==0) {
				model.addAttribute(users);
				return "redirect:Profile";				
			}else {
				return "redirect:adminPanel";
			}	
        } else {
        	return "Login";
        }
	}
	
	
	
	
	//for Data Store in session
	@ModelAttribute("users")
	public Users users() {
		return new Users();
	}
	
	//Open UserUpdate Page with the LoginUser Data
	@GetMapping("/UserUpdate")
	public String profileUser(@ModelAttribute("users") Users users,Model model) {
		
		model.addAttribute(users);
		return "UserUpdate";
	}

	
	
	//Retrieve Data For Data Update
	@PostMapping("/UserUpdate")
	public String userUpdate(@RequestParam("userId") int userId,
			@RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("mobileNumber") String mobileNumber,
            @RequestParam("dob") String dob,
            @RequestParam("gender") String gender,
            @RequestParam("title") String title,
            @RequestParam("langauge") String langauge,
            @RequestParam("country") String country,
            @RequestParam("hobby") String hobby,
            @RequestParam("image") MultipartFile image, Model model ) {
		
		try {
			byte[] imageData = image.getBytes();
			Users users = new Users();
			users.setUserId(userId);
            users.setFirstName(firstName);
            users.setLastName(lastName);
            users.setEmail(email);
            users.setPassword(password);
            users.setMobileNumber(mobileNumber);
            users.setDob(dob);
            users.setGender(gender);
            users.setTitle(title);
            users.setLangauge(langauge);
            users.setCountry(country);
            users.setHobby(hobby);
            users.setImage(imageData);
           
           if(registerService.findUserById(users.getUserId())) {
        	   
        	   registerService.updateUser(users);
        	   Users user =registerService.userById(userId);
            
            	model.addAttribute(user);	
           }
            return "redirect:Profile";
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:UserUpdate";
		}
	}
	
	
	
	//Open AdminSide UserUpdate Page by userId
	@GetMapping("/adminupdate/{userId}")
	public String adminUpdate(@PathVariable int userId,Model model) {
		
		Users users = registerService.userById(userId);
		model.addAttribute(users);
		return "AdminUpdate";
	}

	
	
	//Retrieve Data from adminUpdate Page For update
	@PostMapping("/adminupdate")
	public String adminUserUpdate(@RequestParam("userId") int userId,
			@RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("mobileNumber") String mobileNumber,
            @RequestParam("dob") String dob,
            @RequestParam("gender") String gender,
            @RequestParam("title") String title,
            @RequestParam("langauge") String langauge,
            @RequestParam("country") String country,
            @RequestParam("hobby") String hobby,
            @RequestParam("image") MultipartFile image, Model model ) {
		
		try {
			byte[] imageData = image.getBytes();
			Users users = new Users();
			users.setUserId(userId);
            users.setFirstName(firstName);
            users.setLastName(lastName);
            users.setMobileNumber(mobileNumber);
            users.setDob(dob);
            users.setGender(gender);
            users.setTitle(title);
            users.setLangauge(langauge);
            users.setCountry(country);
            users.setHobby(hobby);
            users.setImage(imageData);
           
            if(registerService.findUserById(users.getUserId())) {
            	Users user = registerService.adminUpdateUser(users);
            	model.addAttribute(user);
            }
            return "redirect:adminPanel";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "AdminUpdate";
		}
	}
	
	
	//Open AdminPanel
	@GetMapping("/adminPanel")
	public String admin(Model model) {
		List<Users> showAllUsers = registerService.findAllStudents();
		model.addAttribute("showAllUsers", showAllUsers);
		return "Admin";
	}
	

	//Delete User
	@PostMapping("/delete")
	public ResponseEntity<String> deleteUser(@RequestParam("userId") int userId) {
		
		registerService.deleteUserById(userId);
		 return ResponseEntity.ok("User Deleted");
	}
	
	
	//Logout
	@GetMapping("/Logout")
	 public String logout(SessionStatus attributes) {
        // Remove attributes from session
        attributes.setComplete();
       
        return "Login";
    }
	
}
