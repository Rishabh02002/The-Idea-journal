package com.college.media.dao.services;

import com.college.media.dao.repository.UserRepository;
import com.college.media.entities.*;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    // All modifications/writes MUST be transactional
    
    @Transactional
    public User registerNewUser(User user, MultipartFile profilePicFile) throws IOException {
        
        // 1. Process the profile picture file
        if (profilePicFile != null && !profilePicFile.isEmpty()) {
            // Convert MultipartFile to byte[]
            user.setProfilePic(profilePicFile.getBytes());
        } else {
            // Set profilePic to null or a default image byte[] if no file is uploaded
            user.setProfilePic(null); 
        }
        
        // 2. Business logic (e.g., Hashing password, validation) goes here
        
        // 3. Save the user entity (assuming userRepository.save is defined)
        // return userRepository.save(user);
        
        return userRepository.save(user); // Placeholder for repository return
    }

    // Read operations are typically non-transactional (read-only is safer)
    @Transactional(readOnly = true)
    public User authenticateUser(String email,String password) {
        return userRepository.findByEmailAndPassword(email,password);
    }

    @Transactional(readOnly = true)
    public User getUserById(Integer id) {
        return userRepository.findById(id);
    }
}