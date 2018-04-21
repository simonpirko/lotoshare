package com.lotoshare.controler;

import com.lotoshare.entity.Post;
import com.lotoshare.entity.User;
import com.lotoshare.service.CategoryService;
import com.lotoshare.service.PostService;
import com.lotoshare.service.UserService;
import com.mysql.jdbc.Blob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Arrays;
import java.util.Base64;
import java.util.UUID;

@Controller
@RequestMapping(path = "/new")
public class NewPostController {
    private PostService postService;
    private CategoryService categoryService;
    private UserService userService;

    @Autowired
    public void setPostService(PostService postService) {
        this.postService = postService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService; //TODO реализовать User
    }

    @GetMapping
    public String newPost(Model model, HttpServletRequest request) {
        IndexController.IndexControllerUtility utility = new IndexController.IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
        model.addAttribute("post", new Post());
        model.addAttribute("categories", categoryService.findAllByOrderByRunameAsc());
        model.addAttribute("totalSize", postService.findAll());
        model.addAttribute("userCook", cookUser);
        model.addAttribute("title", "Создание нового объявления");
        return "new";
    }

    @PostMapping(path = "/save")
    public String savePost(Post post, HttpServletResponse response, HttpServletRequest request, Model model) {
        NewPostControllerUtility newPostControllerUtility = new NewPostControllerUtility();
        newPostControllerUtility.forSetDescription(post);
        newPostControllerUtility.forSetAndGetCookies(post, response, request);
        IndexController.IndexControllerUtility utility = new IndexController.IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
        post.setShowPost("false");
//        User user = new User();
//        user.setName(post.getAuthor());
//        user.setEmail(post.getEmail());
//        user.setTelephone(post.getTelephone());
//        user.setCook(post.getCook());
//        userService.saveUser(user);
        post.setPostMassage("Модератор: замечания пока что отсутствуют.");
        postService.savePost(post);
        return "redirect:/viewpost/" + cookUser;
    }

    private class NewPostControllerUtility {
        void forSetDescription(Post post) {
            String substring = post.getText().substring(0, 20);
            post.setDescription(substring + "...");
        }

        void forSetAndGetCookies(Post post, HttpServletResponse response, HttpServletRequest request) {
            boolean yesCookie = false;
            Cookie[] cookies = request.getCookies();

            try {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("VALKEY")) {
                        post.setCook(cookie.getValue());
                        yesCookie = true;
                    }
                }
            } catch (NullPointerException e) {
                Cookie cookie = new Cookie("VALKEY", UUID.randomUUID().toString());
                cookie.setPath("/");
//                cookie.setSecure(true);
                cookie.setMaxAge(31536000);
                response.addCookie(cookie);
                post.setCook(cookie.getValue());
                yesCookie = true;
            }


            if (!yesCookie) {
                Cookie cookie = new Cookie("VALKEY", UUID.randomUUID().toString());
                cookie.setPath("/");
//                cookie.setSecure(true);
                cookie.setMaxAge(31536000);
                response.addCookie(cookie);
                post.setCook(cookie.getValue());
            }
        }
    }
}
