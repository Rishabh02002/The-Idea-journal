package com.college.media.dao.services;

import com.college.media.dao.repository.PostRepository;
import com.college.media.entities.*;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;

    // All modifications/writes MUST be transactional
    @Transactional
    public Post savePost(Post post,MultipartFile postImage)throws IOException {
        // Business logic: e.g., Hash the password before saving (omitted here)
        
    	if(postImage!=null&&!postImage.isEmpty())
    	{
    		post.setPostImage(postImage.getBytes());
    	}else {
    		post.setPostImage(null);
    	}
    	
    	return postRepository.save(post);
    }

    // Read operations are typically non-transactional (read-only is safer)
    @Transactional(readOnly = true)
    public Post getPostById(int id) {
        return postRepository.findById(id);
    }

    @Transactional(readOnly = true)
    public List<Post> getAllPosts() {
        return postRepository.findAll();
    }
}