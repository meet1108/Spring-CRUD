package com.springCrud.Service;

import java.util.List;

import com.springCrud.Modal.Users;

public interface RegisterService {

	//insert the Data
	void processUserData(Users users);
	
	//check email Exists or Not
	Boolean checkByEmail(String Email);
	
	//get user login by Email and Password
	Users processLogin(String Email,String Password);
	
	//check User By userId
	Boolean findUserById(int UserId);
	
	//User Update
	Users updateUser(Users users);
	
	//listout all Users
	List<Users> findAllStudents();
	
	//for the AdminUpdate Data
	Users userById(int UserId);
	
	//delete User 
	Boolean deleteUserById(int UserId); 
	
	//Admin Update User
	Users adminUpdateUser(Users users);
}



