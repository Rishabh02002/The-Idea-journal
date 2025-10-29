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

    @Transactional
    public User registerNewUser(User user, MultipartFile profilePicFile) throws IOException {

        if (profilePicFile != null && !profilePicFile.isEmpty()) {
            // Convert MultipartFile to byte[]
            user.setProfilePic(profilePicFile.getBytes());
        } else {
            user.setProfilePic(null);
        }

        return userRepository.save(user); // Placeholder for repository return
    }

    @Transactional(readOnly = true)
    public User authenticateUser(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password);
    }

    @Transactional(readOnly = true)
    public User getUserById(Integer id) {
        return userRepository.findById(id);
    }
}
