package com.college.media.entities;

import jakarta.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; // Mapped to 'id'

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "email_id", unique = true, nullable = false)
    private String emailId;

    @Column(name = "password", nullable = false) // ⬅️ ADD THIS FIELD
    private String password;

    @Column(name = "gender")
    private String gender;

    @Lob
    @Column(name = "profile_pic", columnDefinition = "LONGBLOB")
    private byte[] profilePic;

    // Relationship: One User can make Many Posts
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Post> posts;

    // Relationship: One User can have Many Likes
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Like> likes;

    public User() {
        super();
        // TODO Auto-generated constructor stub
    }

    public User(Integer id, String name, String emailId, String password, String gender, byte[] profilePic, Set<Post> posts, Set<Like> likes) {
        this.id = id;
        this.name = name;
        this.emailId = emailId;
        this.password = password;
        this.gender = gender;
        this.profilePic = profilePic;
        this.posts = posts;
        this.likes = likes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Set<Post> getPosts() {
        return posts;
    }

    public void setPosts(Set<Post> posts) {
        this.posts = posts;
    }

    public Set<Like> getLikes() {
        return likes;
    }

    public void setLikes(Set<Like> likes) {
        this.likes = likes;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte[] getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    
}
