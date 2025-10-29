package com.college.media.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "like_table") // 'like' might be a reserved keyword, using 'like_table'
public class Like {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "like_id")
    private Integer likeId; // Mapped to 'like_id'

    @ManyToOne
    @JoinColumn(name = "post_id", referencedColumnName = "post_id", nullable = false)
    private Post post;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
    private User user;

    public Like(Integer likeId, Post post, User user) {
        super();
        this.likeId = likeId;
        this.post = post;
        this.user = user;
    }

    public Integer getLikeId() {
        return likeId;
    }

    public void setLikeId(Integer likeId) {
        this.likeId = likeId;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Like() {
        super();
        
    }

    
}
