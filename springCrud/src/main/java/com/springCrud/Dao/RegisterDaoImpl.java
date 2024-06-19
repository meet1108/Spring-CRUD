package com.springCrud.Dao;


import java.util.ArrayList;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.springCrud.Modal.Users;

@Repository
public class RegisterDaoImpl implements RegisterDao {

	@Autowired
	SessionFactory sessionFactory;

	public RegisterDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	//Email exists
	@Override
	public Boolean isEmailExists(String email) {
		
			Session session = sessionFactory.openSession();
			Query query = session.createQuery("SELECT COUNT(*) FROM Users WHERE email = :email");
			query.setParameter("email", email);
			Long count = (Long) query.uniqueResult();
			if (count > 0) {
				// Email exists
				return false;
			}
			// Email not exists
			return true;
	}
	
	
	
	
	
	
	
	
	
	
	// Registration Insert User Data
	@Override
	public void insertUser(Users users) {
		try {

			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(users);
			transaction.commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// In login retrive User data by Email and Password
	@Override
	public Users findByEmailAndPassword(String Email, String Password) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query<Users> query = session.createQuery("from Users where Email =:Email and Password =:Password", Users.class);
		query.setParameter("Email", Email);
		query.setParameter("Password", Password);
		Users users = query.uniqueResult();
		transaction.commit();
		session.close();

		return users;
	}

	// User Exists or Not in Database
	@Override
	public Boolean isUserExists(int UserId) {

		Session session = sessionFactory.openSession();
		Query query = session.createQuery("SELECT COUNT(*) FROM Users WHERE UserId = :UserId");
		query.setParameter("UserId", UserId);
		Long count = (Long) query.uniqueResult();
		if (count > 0) {
			// user exists
			return true;
		}
		// user not exists
		return false;
	}
	
	
	
	// User Update its data
	@Override
	public Users updateById(Users users) {

		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			if (users.getImage().length > 0) {
				Query query = session.createQuery(
						"update Users set FirstName=:FirstName,LastName=:LastName,Dob=:Dob,Email=:Email,Password=:Password,"
								+ "MobileNumber=:MobileNumber,Gender=:Gender,Title=:Title,Langauge=:Langauge,Country=:Country,Hobby=:Hobby,"
								+ "Image=:Image where UserId=:UserId");
				query.setParameter("FirstName", users.getFirstName());
				query.setParameter("LastName", users.getLastName());
				query.setParameter("Dob", users.getDob());
				query.setParameter("Email", users.getEmail());
				query.setParameter("Password", users.getPassword());
				query.setParameter("MobileNumber", users.getMobileNumber());
				query.setParameter("Gender", users.getGender());
				query.setParameter("Title", users.getTitle());
				query.setParameter("Langauge", users.getLangauge());
				query.setParameter("Country", users.getCountry());
				query.setParameter("Hobby", users.getHobby());
				query.setParameter("Image", users.getImage());
				query.setParameter("UserId", users.getUserId());
				query.executeUpdate();

			} else {
				Query query = session.createQuery(
						"update Users set FirstName=:FirstName,LastName=:LastName,Dob=:Dob,Email=:Email,Password=:Password,"
								+ "MobileNumber=:MobileNumber,Gender=:Gender,Title=:Title,Langauge=:Langauge,Country=:Country,"
								+ "Hobby=:Hobby where UserId=:UserId");
				query.setParameter("FirstName", users.getFirstName());
				query.setParameter("LastName", users.getLastName());
				query.setParameter("Dob", users.getDob());
				query.setParameter("Email", users.getEmail());
				query.setParameter("Password", users.getPassword());
				query.setParameter("MobileNumber", users.getMobileNumber());
				query.setParameter("Gender", users.getGender());
				query.setParameter("Title", users.getTitle());
				query.setParameter("Langauge", users.getLangauge());
				query.setParameter("Country", users.getCountry());
				query.setParameter("Hobby", users.getHobby());
				query.setParameter("UserId", users.getUserId());
				query.executeUpdate();
			}

			transaction.commit();
		} catch (Exception e) {

			e.printStackTrace();
		} finally {

			session.close();
		}
		return users;
	}

	// For Admin Panel retrive All Users Data From Database
	@Override
	public List<Users> findAllStudents() {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		List<Users> allUsers = new ArrayList<Users>();

		try {
			transaction = session.beginTransaction();
			Query<Users> query = session.createQuery("from Users where Role=:Role", Users.class);
			query.setParameter("Role", 0);
			List<Users> resultList = query.getResultList();
			allUsers.addAll(resultList);
			transaction.commit();
		} catch (RuntimeException e) {
			if (transaction != null) {
				transaction.rollback();
			}
			throw e;
		} finally {
			session.close();
		}
		return allUsers;
	}

	// Retrive Users Data by UserID
	@Override
	public Users userById(int UserId) {

		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Query<Users> query = session.createQuery("from Users where UserId=:UserId", Users.class);
		query.setParameter("UserId", UserId);
		Users users = query.uniqueResult();
		transaction.commit();
		session.close();

		return users;
	}

	// Admin Delete Users
	@Override
	public Boolean deleteUser(int UserId) {
		Session session = null;
		Transaction transaction = null;

		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			Query query = session.createQuery("delete from Users where UserId = :UserId");
			query.setParameter("UserId", UserId);
			query.executeUpdate();

			transaction.commit();
			return true;
		} catch (Exception e) {

			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			return false;
		}

		finally {
			session.close();

		}

	}

	// Admin Update User Data
	@Override
	public Users adminUpdateById(Users users) {
		System.out.println(users.getUserId() + "admin ");
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			if (users.getImage().length > 0) {
				Query query = session.createQuery(
						"update Users set FirstName=:FirstName,LastName=:LastName,Dob=:Dob,MobileNumber=:MobileNumber,"
								+ "Gender=:Gender,Title=:Title,Langauge=:Langauge,Country=:Country,Hobby=:Hobby,Image=:Image where userId=:userId");
				query.setParameter("FirstName", users.getFirstName());
				query.setParameter("LastName", users.getLastName());
				query.setParameter("Dob", users.getDob());
				query.setParameter("MobileNumber", users.getMobileNumber());
				query.setParameter("Gender", users.getGender());
				query.setParameter("Title", users.getTitle());
				query.setParameter("Langauge", users.getLangauge());
				query.setParameter("Country", users.getCountry());
				query.setParameter("Hobby", users.getHobby());
				query.setParameter("Image", users.getImage());
				query.setParameter("userId", users.getUserId());
				query.executeUpdate();

			} else {
				Query query = session.createQuery(
						"update Users set FirstName=:FirstName,LastName=:LastName,Dob=:Dob,MobileNumber=:MobileNumber,Gender=:Gender,"
								+ "Title=:Title,Langauge=:Langauge,Country=:Country,Hobby=:Hobby where userId=:userId");
				query.setParameter("FirstName", users.getFirstName());
				query.setParameter("LastName", users.getLastName());
				query.setParameter("Dob", users.getDob());
				query.setParameter("MobileNumber", users.getMobileNumber());
				query.setParameter("Gender", users.getGender());
				query.setParameter("Title", users.getTitle());
				query.setParameter("Langauge", users.getLangauge());
				query.setParameter("Country", users.getCountry());
				query.setParameter("Hobby", users.getHobby());
				query.setParameter("userId", users.getUserId());
				query.executeUpdate();
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {

			session.close();
		}

		return users;
	}

}
