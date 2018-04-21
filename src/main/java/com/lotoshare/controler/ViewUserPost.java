package com.lotoshare.controler;

import com.lotoshare.configuration.PageWrapper;
import com.lotoshare.entity.Category;
import com.lotoshare.entity.Post;
import com.lotoshare.service.CategoryService;
import com.lotoshare.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/viewpost")
public class ViewUserPost {
    private PostService postService;
    private CategoryService categoryService;

    @Autowired
    public void setPostService(PostService postService){
        this.postService = postService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/{cook}")
    public String viewPost(@PathVariable("cook") String cook, Model model, Pageable pageable, HttpServletRequest request){
        Page<Post> allByCookContaining = postService.findAllByCook(cook, pageable);
        List<Category> all = categoryService.findAllByOrderByRunameAsc();
        PageWrapper<Post> page = new PageWrapper<>(allByCookContaining, "/viewpost/" + cook);
        IndexController.IndexControllerUtility utility = new IndexController.IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
        model.addAttribute("title", "Добро пожаловать на LOTOSHARE.BY");
        model.addAttribute("categories", all);
        model.addAttribute("posts", allByCookContaining.getContent());
        model.addAttribute("page", page);
        model.addAttribute("userCook", cookUser);
        model.addAttribute("postsSize", allByCookContaining.getContent().size());
        return "viewuserpost";
    }
}
