package com.lotoshare.service;

import com.lotoshare.entity.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Set;

public interface PostService {
    Integer findAll();

    Page<Post> findAllByShowPostOrderByDateDesc(String showPost, Pageable pageable);

    Page<Post> findAllByCategoryAndShowPostOrderByDateDesc(String category, String showPost, Pageable pageable);

    Page<Post> findAllByTitleContainingAndShowPost(String title, String showPost ,Pageable pageable);

    Page<Post> findAllByCook(String cook, Pageable pageable);

    Post getPostById(Long id);

    void savePost(Post post);

    void deletePost(Long id);
}
