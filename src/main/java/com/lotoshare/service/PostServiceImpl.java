package com.lotoshare.service;

import com.lotoshare.entity.Post;
import com.lotoshare.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Set;

@Service
@Transactional
public class PostServiceImpl implements PostService {
    private PostRepository postRepository;

    @Autowired
    public void setPostRepository(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    @Override
    public Integer findAll() {
        return postRepository.findAll().size();
    }

    @Override
    public Page<Post> findAllByShowPostOrderByDateDesc(String showPost, Pageable pageable) {
        return postRepository.findAllByShowPostOrderByDateDesc(showPost, pageable);
    }

    @Override
    public Page<Post> findAllByCategoryAndShowPostOrderByDateDesc(String category, String showPost, Pageable pageable) {
        return postRepository.findAllByCategoryAndShowPostOrderByDateDesc(category, showPost ,pageable);
    }

    @Override
    public Page<Post> findAllByTitleContainingAndShowPost(String title, String showPost, Pageable pageable) {
        return postRepository.findAllByTitleContainingAndShowPost(title, showPost ,pageable);
    }

    @Override
    public Page<Post> findAllByCook(String cook, Pageable pageable) {
        return postRepository.findAllByCook(cook, pageable);
    }

    @Override
    public Post getPostById(Long id) {
        return postRepository.findOne(id);
    }

    @Override
    public void savePost(Post post) {
        postRepository.save(post);
    }

    @Override
    public void deletePost(Long id) {
        postRepository.delete(id);
    }
}
