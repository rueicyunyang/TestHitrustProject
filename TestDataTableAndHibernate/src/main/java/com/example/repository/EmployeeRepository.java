package com.example.repository;

import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.model.Employee;

@Repository("employeeRepository")
public class EmployeeRepository {
	
//	private static Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
    @Autowired
	private SessionFactory sessionFactory; 
    
//    public EmployeeRepository() {
//    }
//    
//    public EmployeeRepository(SessionFactory sessionFactory) { 
//        this.setSessionFactory(sessionFactory);
//    }
    
//    public void setSessionFactory(
//                        SessionFactory sessionFactory) {
//        StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
//        this.sessionFactory = configuration.buildSessionFactory(ssrb.build());
////        this.sessionFactory = new Configuration().configure()
////                .buildSessionFactory(); 
//    } 
//
	public List<Employee> findAll(){
		
        Session session = sessionFactory.openSession(); 
        
        List<Employee> list = (List<Employee>) session.createQuery("from Employee").list();
        
        session.close();
        
        return list;
	}
}
