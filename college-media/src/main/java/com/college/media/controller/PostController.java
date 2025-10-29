package com.college.media.controller;

import com.college.media.dao.services.*;

import com.college.media.entities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpServletRequest; // Used for session management example
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.web.bind.WebDataBinder;

@Controller
@RequestMapping("/")
public class PostController {

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("postImage");
    }

    @Autowired
    private PostService postService;

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UserService userService;

    @Autowired
    private LikeService likeService;

    private User getCurrentUser(HttpServletRequest request) {
        return (User) request.getSession().getAttribute("currentUser");
    }

   
    @GetMapping("/content")
    public String showContentPage(HttpServletRequest request, Model model) {
        User currentUser = getCurrentUser(request);
        if (currentUser == null) {
            // Redirect to login if not authenticated
            return "redirect:/login";
        }

        Map<Integer, Long> likesMap = new HashMap<Integer, Long>();
        for (Post post : postService.getAllPosts()) {
            long likesCount = likeService.totalLikesOnPost(post.getPostId());
            likesMap.put(post.getPostId(), likesCount);
        }

        model.addAttribute("currentUser", currentUser);
        model.addAttribute("posts", postService.getAllPosts());
        model.addAttribute("categories", categoryService.getAllCategories());
        model.addAttribute("Likes", likesMap);

        return "content"; // Maps to /WEB-INF/views/content.jsp
    }

   
    @GetMapping("/post/new")
    public String showNewPostForm(HttpServletRequest request, Model model) {
        User currentUser = getCurrentUser(request);
        if (currentUser == null) {
            return "redirect:/login"; // Secure this route
        }

        model.addAttribute("post", new Post());
        model.addAttribute("categories", categoryService.getAllCategories());
        return "new-post";
    }

    @PostMapping("/post/new")
    public String handleNewPost(@ModelAttribute("post") Post post, @RequestParam("postImage") MultipartFile postImage,
            HttpServletRequest request, RedirectAttributes redirectAttributes) {

        User currentUser = getCurrentUser(request);
        if (currentUser == null) {
            return "redirect:/login"; // Secure this route
        }

        try {
            post.setUser(currentUser);
            post.setLikes(null);
            postService.savePost(post, postImage);
            redirectAttributes.addFlashAttribute("successMessage", "Your post has been successfully published!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Oops there is some problem in post");
            e.printStackTrace();
        }
        return "redirect:/content";
    }

 
    @GetMapping("/post/{postId}")
    public String viewSinglePost(@PathVariable("postId") int postId, HttpServletRequest request, Model model) {

        if (getCurrentUser(request) == null) {
            return "redirect:/login"; // Secure this route
        }

        Post post = postService.getPostById(postId);

        if (post == null) {
            // Handle post not found (e.g., return 404 error page)
            return "redirect:/content";
        }

        Like like = likeService.getLikesByUserAndPost(postId, getCurrentUser(request).getId());
        model.addAttribute("like", like);
        model.addAttribute("likes", likeService.totalLikesOnPost(post.getPostId()));
        model.addAttribute("post", post);
        return "post-detail";
    }

    @GetMapping("/image/user/{userId}")
    public ResponseEntity<byte[]> getUserImage(@PathVariable("userId") int userId) {
        User user = userService.getUserById(userId);

        if (user != null && user.getProfilePic() != null) {
            byte[] imageBytes = user.getProfilePic();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG);
            headers.setContentLength(imageBytes.length);

            return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
        }

        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @GetMapping("/image/post/{postId}")
    public ResponseEntity<byte[]> getPostImage(@PathVariable("postId") int postId) {
        Post post = postService.getPostById(postId);

        if (post != null && post.getPostImage() != null) {
            byte[] imageBytes = post.getPostImage();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.IMAGE_JPEG);
            headers.setContentLength(imageBytes.length);

            return new ResponseEntity<>(imageBytes, headers, HttpStatus.OK);
        }

         return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    @GetMapping("/likes/post/{postId}")
    public String likesModule(@PathVariable("postId") int postId, HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {
        try {
            User user = getCurrentUser(request);
            Post post = postService.getPostById(postId);

            Like like = new Like();
            like.setUser(user);
            like.setPost(post);
            likeService.saveLike(like);
            Long likes = likeService.totalLikesOnPost(postId);
            Like liked = likeService.getLikesByUserAndPost(postId, user.getId());
            model.addAttribute("like", liked);
            model.addAttribute("likes", likes);
            model.addAttribute("post", post);
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("likeError", "there is some porblem in like Module");
        }

        return "post-detail";
    }

}
