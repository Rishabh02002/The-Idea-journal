package com.college.media.dao.repository;

import java.util.List;

public interface GenericRepository<T, ID> {
    T save(T entity);
    T findById(ID id);
    List<T> findAll();
    void delete(T entity);
}