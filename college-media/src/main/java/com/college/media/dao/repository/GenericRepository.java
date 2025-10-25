package com.college.media.dao.repository;

import java.util.List;

// A simple interface to standardize repository methods
public interface GenericRepository<T, ID> {
    T save(T entity);
    T findById(ID id);
    List<T> findAll();
    void delete(T entity);
}