package com.college.media.dao.repository;

import com.college.media.entities.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserRepository implements GenericRepository<User, Integer> {

    @Autowired
    private SessionFactory sessionFactory;

    // Helper method to get the current session
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("deprecation")
	@Override
    public User save(User user) {
        getCurrentSession().saveOrUpdate(user);
        return user;
    }

    @Override
    public User findById(Integer id) {
        return getCurrentSession().get(User.class, id);
    }

    // Custom method specific to User logic
    public User findByEmailAndPassword(String email,String password) {
        Query<User> query= getCurrentSession().createQuery("FROM User WHERE emailId = :email AND password = :password", User.class);
        query.setParameter("email", email);
        query.setParameter("password", password);
        return query.uniqueResult();
                
                 // Use uniqueResult for single returns
    }

    @Override
    public List<User> findAll() {
        return getCurrentSession().createQuery("FROM User", User.class).list();
    }

    @SuppressWarnings("deprecation")
	@Override
    public void delete(User user) {
        getCurrentSession().delete(user);
    }
}