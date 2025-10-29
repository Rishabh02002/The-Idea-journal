package com.college.media.dao.repository;
import com.college.media.entities.*;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryRepository implements GenericRepository<Category, Integer> {

    @Autowired
    private SessionFactory sessionFactory;

     private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("deprecation")
	@Override
    public Category save(Category category) {
        getCurrentSession().saveOrUpdate(category);
        return category;
    }

    @Override
    public Category findById(Integer id) {
        return getCurrentSession().get(Category.class, id);
    }

    public Category findByEmail(String email) {
        return getCurrentSession().createQuery("FROM Category WHERE emailId = :email", Category.class)
                .setParameter("email", email)
                .uniqueResult(); // Use uniqueResult for single returns
    }

    @Override
    public List<Category> findAll() {
        return getCurrentSession().createQuery("FROM Category", Category.class).list();
    }

    @SuppressWarnings("deprecation")
	@Override
    public void delete(Category category) {
        getCurrentSession().delete(category);
    }
}
