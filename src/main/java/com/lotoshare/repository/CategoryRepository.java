package com.lotoshare.repository;

import com.lotoshare.entity.Category;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CategoryRepository extends CrudRepository<Category, Integer> {
    List<Category> findAllByOrderByRunameAsc();
}
