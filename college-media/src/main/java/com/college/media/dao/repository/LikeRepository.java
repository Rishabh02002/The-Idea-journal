package com.college.media.dao.repository;

import com.college.media.entities.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LikeRepository implements GenericRepository<Like, Integer> {

    @Autowired
    private SessionFactory sessionFactory;

    // Helper method to get the current session
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("deprecation")

    @Override
    public Like save(Like like) {
        getCurrentSession().saveOrUpdate(like);
        return like;
    }

    @Override
    public Like findById(Integer id) {
        return getCurrentSession().get(Like.class, id);
    }

    // Custom method specific to Like logic
    public Long getTotalLikes(int postID) {
        return getCurrentSession().createQuery(// Corrected JPQL/HQL Query String
                "select count(l) from Like l where l.post.postId = :postID", Long.class)
                .setParameter("postID", postID)
                .uniqueResult(); // Use uniqueResult for single returns
    }

    @Override
    public List<Like> findAll() {
        return getCurrentSession().createQuery("FROM Like", Like.class).list();
    }

    public Like getLikeByUserAndPost(int postId, int userId) {
        return getCurrentSession().createQuery("SELECT l FROM Like l WHERE l.post.id = :postId AND l.user.id = :userId", Like.class).setParameter("postId", postId).setParameter("userId", userId).uniqueResult();
    }

    @SuppressWarnings("deprecation")
    @Override
    public void delete(Like like) {
        getCurrentSession().delete(like);
    }
}
