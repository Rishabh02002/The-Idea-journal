package com.college.media.entities;

import jakarta.persistence.*;
import java.util.Set;

@Entity
@Table(name = "post")
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_id")
    private Integer postId; // Mapped to 'post_id'

    @Column(name = "post_title", nullable = false)
    private String postTitle;

    @Column(name = "post_content", columnDefinition = "TEXT")
    private String postContent;

    @Lob
    @Column(name = "post_image", columnDefinition = "LONGBLOB")
    private byte[] postImage;
    // Foreign Key: user_id (Many Posts belong to One User)
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    private User user; // This references the User entity

    // Foreign Key: c_id (Many Posts belong to One Category)
    @ManyToOne
    @JoinColumn(name = "c_id", referencedColumnName = "category_id", nullable = false)
    private Category category; // This references the Category entity

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Like> likes;

    public Integer getPostId() {
        return postId;
    }

    public Post() {
        super();
        
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Set<Like> getLikes() {
        return likes;
    }

    public void setLikes(Set<Like> likes) {
        this.likes = likes;
    }

    public Post(Integer postId, String postTitle, String postContent, byte[] postImage, User user, Category category,
            Set<Like> likes) {
        super();
        this.postId = postId;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postImage = postImage;
        this.user = user;
        this.category = category;
        this.likes = likes;
    }

    public byte[] getPostImage() {
        return postImage;
    }

    public void setPostImage(byte[] postImage) {
        this.postImage = postImage;
    }

   
}
