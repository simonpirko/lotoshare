package com.lotoshare.service;

import com.lotoshare.entity.Category;

import java.util.List;

public interface CategoryService {
    List<Category> findAllByOrderByRunameAsc();
}
