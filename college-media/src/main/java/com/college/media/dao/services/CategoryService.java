package com.college.media.dao.services;

import com.college.media.dao.repository.CategoryRepository;

import com.college.media.entities.*;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Transactional
    public Category saveCategory(Category category) {
        // Business logic: e.g., Hash the password before saving (omitted here)
        return categoryRepository.save(category);
    }

    @Transactional(readOnly = true)
    public Category getCategoryById(int id) {
        return categoryRepository.findById(id);
    }

    @Transactional(readOnly = true)
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }
}