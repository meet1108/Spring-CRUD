package com.springCrud.Dao;

import java.util.List;

import com.springCrud.Modal.Users;


public interface RegisterDao {

	//Email exists
	Boolean isEmailExists(String Email);
	
	//insert Data
	void insertUser(Users users);
	
	//find by user by Email and Password
	Users findByEmailAndPassword(String Email,String Password);

	//check user
	Boolean isUserExists(int UserId);
	
	//User Update
	Users updateById(Users users);
	
	//find all Users
	List<Users> findAllStudents();
	
	//user data for admin update page
	Users userById(int UserId);
	
	//delete User
	Boolean deleteUser(int UserId);
	
	//Admin Update User Data
	Users adminUpdateById(Users users);
	
	
}
