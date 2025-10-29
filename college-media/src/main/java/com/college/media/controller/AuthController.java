package com.college.media.controller;

import com.college.media.dao.services.*;

import com.college.media.entities.User;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("profilePic");
    }

    @GetMapping("/")
    public String showIndexPage() {
        return "index"; 
    }

    // --- Login ---
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam("email") String email, @RequestParam("password") String password,
            HttpServletRequest request, // Needed to manage session
            Model model) {

        User user = userService.authenticateUser(email, password);

        if (user != null) {
            // SUCCESS: Store the user object in the session to track login state
            request.getSession().setAttribute("currentUser", user);
            return "redirect:/content"; 
        } else {
            // FAILURE
            model.addAttribute("error", "Invalid credentials. Please try again.");
            return "login";
        }
    }

    // --- Logout ---
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        // Invalidate the session, removing the 'currentUser' attribute
        request.getSession().invalidate();
        return "redirect:/"; // Redirect to the public index page
    }

    // --- Registration---
    @GetMapping("/register")
    public String showRegisterPage(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String handleRegistration(@ModelAttribute("user") User user, @RequestParam("profilePic") MultipartFile profilePicFile, RedirectAttributes redirectAttributes) {
        try {
            userService.registerNewUser(user, profilePicFile);
            redirectAttributes.addFlashAttribute("message", "Registration successful! Please log in.");
            return "redirect:/login";
        } catch (Exception e) {
            
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/register";
        }
    }
}
