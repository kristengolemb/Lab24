package com.golembiewski.lab24;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class DAO {
	private static SessionFactory factory;

	private static void setupFactory() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			;
		}
		Configuration configuration = new Configuration();
		// modify these to match your XML files
		configuration.configure("hibernate.cfg.xml");
		configuration.addResource("user.hbm.xml");

		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				.applySettings(configuration.getProperties()).build();
		factory = configuration.buildSessionFactory(serviceRegistry);
	}

	public static int addUser(User u) {
		if (factory == null)
			setupFactory();
		// Get current session
		Session hibernateSession = factory.openSession();

		// Begin transaction
		hibernateSession.getTransaction().begin();

		// save this specific record
		int i = (Integer) hibernateSession.save(u);

		// Commit transaction
		hibernateSession.getTransaction().commit();

		hibernateSession.close();

		return i;
	}

	public static void deleteUser(int id) {
		if (factory == null)
			setupFactory();
		// Get current session
		Session hibernateSession = factory.openSession();

		// Begin transaction
		hibernateSession.getTransaction().begin();

		// save this specific record
		hibernateSession.createQuery("DELETE FROM User WHERE id =" + id).executeUpdate();
		// hibernateSession.createQuery("DELETE FROM Product WHERE id = '" + id
		// + "'");

		// Commit transaction
		hibernateSession.getTransaction().commit();

		hibernateSession.close();
	}

	public static List<User> getAllUsers() {
		if (factory == null)
			setupFactory();
		// Get current session
		Session hibernateSession = factory.openSession();

		// Begin transaction
		hibernateSession.getTransaction().begin();

		// deprecated method & unsafe cast
		List<User> users = hibernateSession.createQuery("FROM User").list();

		// Commit transaction
		hibernateSession.getTransaction().commit();

		hibernateSession.close();

		return users;
	}
}