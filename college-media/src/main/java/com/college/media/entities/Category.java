package com.college.media.entities;

import jakarta.persistence.*;
import java.util.Set;

@Entity
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private Integer categoryId; // Mapped to 'category_id'

    @Column(name = "category_type", unique = true, nullable = false)
    private String categoryType;

    // Relationship: One Category can have Many Posts
    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Post> posts;

	public Category(Integer categoryId, String categoryType, Set<Post> posts) {
		super();
		this.categoryId = categoryId;
		this.categoryType = categoryType;
		this.posts = posts;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public Set<Post> getPosts() {
		return posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

	

    // Getters and Setters (omitted for brevity)
    
}