package com.mydomain.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.mongodb.morphia.Datastore;

import com.mydomain.infra.ServicesFactory;
import com.mysocial.model.User;


@Path("/user")
public class UserService {

	@GET
	@Path("/{param}")
	@Produces({MediaType.APPLICATION_JSON})
	public User getUser(@PathParam("param") Integer id) {
		Session ses = HibernateUtil.currentSession();
		try {
			User u = (User) ses.load(User.class, id);
			User simpleUser = new User();
			return simpleUser;
		} finally {
			HibernateUtil.closeSession();
		}
	}
	
	@GET
	@Produces({MediaType.APPLICATION_JSON})
	public List<User> getUsers() {
		System.out.println("Inside get");
		Datastore dataStore = ServicesFactory.getMongoDB();
		List<User> u = (dataStore.createQuery(User.class).asList());
		System.out.println(u);
		return u;
	}
	
	@POST
//	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
//	public void createUser(@FormParam("name") String name,@FormParam("age") Integer age,@FormParam("emailId") String emailId){
//		System.out.println("Creating user: "+name+" Age: "+age);
//		User u = new User();
//		u.setName(name);
//		u.setAge(age);
//		u.setEmailId(emailId);
//		Session ses = HibernateUtil.currentSession();
	@Consumes(MediaType.APPLICATION_JSON)
	public void createUser(User u){
		Datastore dataStore = ServicesFactory.getMongoDB();
		dataStore.save(u);
	}
	
	@PUT
//	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
//	public void updateUser(@FormParam("id") Integer id, @FormParam("name") String name,@FormParam("age") Integer age,@FormParam("emailId") String emailId){
//		System.out.println("Updating user");
//		User u = new User();
//		u.setId(id);
//		u.setName(name);
//		u.setAge(age);
//		u.setEmailId(emailId);
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateUser(User u){
		Session ses = HibernateUtil.currentSession();
		try {
			Transaction tx = ses.beginTransaction();
			ses.update(u);
			tx.commit();
		}finally{
			HibernateUtil.closeSession();
		}
	}
	
	@DELETE
	@Path("/{param}")
	@Produces({MediaType.APPLICATION_JSON})
	public boolean deleteUser(@PathParam("param") Integer id) {
		System.out.println("Deleting user: "+id);
		Session ses = HibernateUtil.currentSession();
		try {
			Transaction tx = ses.beginTransaction();
			User u = (User) ses.load(User.class, id);
			ses.delete(u);
			tx.commit();
			return true;
		} finally {
			HibernateUtil.closeSession();
		}
	}
	
}
