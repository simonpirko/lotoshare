package com.lotoshare.repository;

import com.lotoshare.entity.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Set;

public interface PostRepository extends CrudRepository<Post, Long> {
    Set<Post> findAll();

    Page<Post> findAllByShowPostOrderByDateDesc(String showPost, Pageable pageable);

    Page<Post> findAllByCategoryAndShowPostOrderByDateDesc(String category, String showPost, Pageable pageable);

    Page<Post> findAllByTitleContainingAndShowPost(String title, String showPost, Pageable pageable);

    Page<Post> findAllByCook(String cook, Pageable pageable);
}
