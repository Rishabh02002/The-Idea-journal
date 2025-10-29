package com.college.media.dao.services;

import com.college.media.dao.repository.LikeRepository;
import com.college.media.entities.*;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LikeService {

    @Autowired
    private LikeRepository likeRepository;

    @Transactional
    public Like saveLike(Like like) throws IOException {

        return likeRepository.save(like);
    }

    @Transactional(readOnly = true)
    public Like getLikeById(int id) {
        return likeRepository.findById(id);
    }

    @Transactional(readOnly = true)
    public List<Like> getAllLikes() {
        return likeRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Long totalLikesOnPost(int postId) {
        return likeRepository.getTotalLikes(postId);
    }

    @Transactional(readOnly = true)
    public Like getLikesByUserAndPost(int postId, int userId) {
        return likeRepository.getLikeByUserAndPost(postId, userId);
    }
}
