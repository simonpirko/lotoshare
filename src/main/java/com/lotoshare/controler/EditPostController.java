package com.lotoshare.controler;

import com.lotoshare.entity.Post;
import com.lotoshare.service.CategoryService;
import com.lotoshare.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/edit")
public class EditPostController {
    private PostService postService;
    private CategoryService categoryService;
    private Long postId;
    private String postCook;
    private String postEmail;
    private String postMassage;

    @Autowired
    public void setPostService(PostService postService) {
        this.postService = postService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/{id}")
    public String getPost(@PathVariable("id") Long id, Model model, HttpServletRequest request) {
        EditPostControllerUtility Utility = new EditPostControllerUtility();
        String cook = postService.getPostById(id).getCook();
        IndexController.IndexControllerUtility utility = new IndexController.IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
        if (!Utility.getAndSetCook(request, cook)) return "redirect:/";
        model.addAttribute("post", postService.getPostById(id));
        model.addAttribute("categories", categoryService.findAllByOrderByRunameAsc());
        model.addAttribute("title", "Редактирование объявления #" + postId);
        model.addAttribute("userCook", cookUser);
        postId = postService.getPostById(id).getId();
        postCook = postService.getPostById(id).getCook();
        postEmail = postService.getPostById(id).getEmail();
        postMassage = postService.getPostById(id).getPostMassage();
        return "editpost";
    }

    @PostMapping(value = "/save")
    public String savePostEdit(Post post) {
        post.setId(postId);
        post.setCook(postCook);
        post.setEmail(postEmail);
        post.setShowPost("false");
        post.setPostMassage(postMassage);
        postService.savePost(post);
        return "redirect:/post/" + post.getId();
    }

    @GetMapping(value = "/delete/{id}")
    public String deletePost(@PathVariable("id") Long id, HttpServletRequest request) {
        IndexController.IndexControllerUtility utility = new IndexController.IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
        EditPostControllerUtility Utility = new EditPostControllerUtility();
        String cook = postService.getPostById(id).getCook();
        if (Utility.getAndSetCook(request, cook)) postService.deletePost(id);
        return "redirect:/viewpost/" + cookUser;
    }

    static class EditPostControllerUtility {
        boolean getAndSetCook(HttpServletRequest request, String postCook) {
            Cookie[] cookies = request.getCookies();
            boolean yesCook = false;
            String cook = "";
            try {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("VALKEY")) {
                        cook = cookie.getValue();
                        yesCook = true;
                    }
                }
            } catch (NullPointerException e) {
                return false;
            }
            return yesCook && cook.equals(postCook);
        }
    }
}
