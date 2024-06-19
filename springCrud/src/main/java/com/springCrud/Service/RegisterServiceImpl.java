package com.springCrud.Service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springCrud.Dao.RegisterDao;
import com.springCrud.Modal.Users;

@Service
public class RegisterServiceImpl implements RegisterService {

	private final RegisterDao registerDao;

	public RegisterServiceImpl(RegisterDao registerDao) {
		this.registerDao = registerDao;
	}

	//check Email
	public Boolean checkByEmail(String email) {
		return registerDao.isEmailExists(email);
	}
	
	//insert the Data
	public void processUserData(Users users) {

		registerDao.insertUser(users);
	}

	
	//get user login by Email and Password
	public Users processLogin(String Email, String Password) {

		return registerDao.findByEmailAndPassword(Email, Password);
	}

	
	//check User By userId
	public Boolean findUserById(int UserId) {

		return registerDao.isUserExists(UserId);
	}

	
	//User Update
	public Users updateUser(Users users) {

		return registerDao.updateById(users);
	}

	
	//listout all Users
	public List<Users> findAllStudents() {

		return registerDao.findAllStudents();
	}

	
	//for the AdminUpdate Data
	public Users userById(int UserId) {

		return registerDao.userById(UserId);
	}

	
	//delete User 
	public Boolean deleteUserById(int UserId) {

		return registerDao.deleteUser(UserId);
	}

	
	//Admin Update User
	public Users adminUpdateUser(Users users) {

		return registerDao.adminUpdateById(users);
	}

}
