package com.college.media.dao.repository;



import com.college.media.entities.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PostRepository implements GenericRepository<Post, Integer> {

    @Autowired
    private SessionFactory sessionFactory;

    // Helper method to get the current session
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("deprecation")
	@Override
    public Post save(Post post) {
        getCurrentSession().saveOrUpdate(post);
        return post;
    }

    @Override
    public Post findById(Integer id) {
        return getCurrentSession().get(Post.class, id);
    }

    public Post findByEmail(String email) {
        return getCurrentSession().createQuery("FROM Post WHERE emailId = :email", Post.class)
                .setParameter("email", email)
                .uniqueResult(); // Use uniqueResult for single returns
    }

    @Override
    public List<Post> findAll() {
        return getCurrentSession().createQuery("FROM Post", Post.class).list();
    }

    @SuppressWarnings("deprecation")
	@Override
    public void delete(Post post) {
        getCurrentSession().delete(post);
    }
}
