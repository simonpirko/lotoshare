package com.lotoshare.controler;

import com.lotoshare.configuration.PageWrapper;
import com.lotoshare.entity.Category;
import com.lotoshare.entity.Massage;
import com.lotoshare.entity.Post;
import com.lotoshare.entity.User;
import com.lotoshare.repository.MassageRepository;
import com.lotoshare.service.CategoryService;
import com.lotoshare.service.MassageService;
import com.lotoshare.service.PostService;
import com.lotoshare.service.UserService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(path = "/")
public class IndexController {
    private PostService postService;
    private CategoryService categoryService;
    private MassageService massageService;
//    private UserService userService;
//    private User user;

    @Autowired
    public void setPostService(PostService postService) {
        this.postService = postService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setMassageService(MassageService massageService) {
        this.massageService = massageService;
    }

//    @Autowired
//    public void setUserService(UserService userService) {
//        this.userService = userService;
//    }

    @GetMapping
    public String sortDateDesc(Model model, Pageable pageable, HttpServletRequest request) {
        Page<Post> sortedDateDescPost = postService.findAllByShowPostOrderByDateDesc("true", pageable);
        PageWrapper<Post> page = new PageWrapper<>(sortedDateDescPost, "/");
        List<Category> all = categoryService.findAllByOrderByRunameAsc();
        Massage massageById = massageService.getMassageById(1);
        Massage massageById2 = massageService.getMassageById(2);
        IndexController.IndexControllerUtility utility = new IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
//        if(!cookUser.equals("false")){
//            user = userService.findByCook(cookUser);
//        } else {
//            user.setName("guest");
//        }
        model.addAttribute("alertMassage", massageById.getMassage());
        model.addAttribute("alertMassageShow", massageById.getShow());
        model.addAttribute("massage", massageById2.getMassage());
        model.addAttribute("categories", all);
        model.addAttribute("totalSize", postService.findAll());
        model.addAttribute("posts", sortedDateDescPost.getContent());
        model.addAttribute("page", page);
        model.addAttribute("postsSize", sortedDateDescPost.getContent().size());
        model.addAttribute("userCook", cookUser);
//        model.addAttribute("user", user.getName());
        model.addAttribute("title", "Добро пожаловать на LOTOSHARE.BY");
        return "index";
    }

    @GetMapping(path = "/sort/{category}")
    public String getPostByCategory(@PathVariable("category") String category, Pageable pageable, Model model, HttpServletRequest request) {
        Page<Post> postsOrCategory = postService.findAllByCategoryAndShowPostOrderByDateDesc(category, "true", pageable);
        PageWrapper<Post> page = new PageWrapper<>(postsOrCategory, "/sort/" + category);
        List<Category> all = categoryService.findAllByOrderByRunameAsc();
        Massage massageById = massageService.getMassageById(1);
        Massage massageById2 = massageService.getMassageById(2);
        IndexController.IndexControllerUtility utility = new IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
        model.addAttribute("alertMassage", massageById.getMassage());
        model.addAttribute("alertMassageShow", massageById.getShow());
        model.addAttribute("massage", massageById2.getMassage());
        model.addAttribute("categories", all);
        model.addAttribute("totalSize", postService.findAll());
        model.addAttribute("page", page);
        model.addAttribute("posts", postsOrCategory.getContent());
        model.addAttribute("postsSize", postsOrCategory.getContent().size());
        model.addAttribute("userCook", cookUser);
        model.addAttribute("title", "Добро пожаловать на LOTOSHARE.BY");
        return "index";
    }

    @GetMapping(path = "/search")
    public String getPostByTitle(@RequestParam(value = "q") String q, Model model, Pageable pageable, HttpServletRequest request) {
        Page<Post> allByTitle = postService.findAllByTitleContainingAndShowPost(q, "true", pageable);
        PageWrapper<Post> page = new PageWrapper<>(allByTitle, "/search" + q);
        List<Category> all = categoryService.findAllByOrderByRunameAsc();
        Massage massageById = massageService.getMassageById(1);
        Massage massageById2 = massageService.getMassageById(2);
        IndexController.IndexControllerUtility utility = new IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
        model.addAttribute("alertMassage", massageById.getMassage());
        model.addAttribute("alertMassageShow", massageById.getShow());
        model.addAttribute("massage", massageById2.getMassage());
        model.addAttribute("categories", all);
        model.addAttribute("totalSize", postService.findAll());
        model.addAttribute("page", page);
        model.addAttribute("posts", allByTitle.getContent());
        model.addAttribute("postsSize", allByTitle.getContent().size());
        model.addAttribute("userCook", cookUser);
        model.addAttribute("title", "Добро пожаловать на LOTOSHARE.BY");
        return "index";
    }

    @GetMapping(path = "/post/{id}")
    public String getPostById(@PathVariable Long id, Model model, HttpServletRequest request) {
        EditPostController.EditPostControllerUtility editPostControllerUtility = new EditPostController.EditPostControllerUtility();
        boolean andSetCook = editPostControllerUtility.getAndSetCook(request, postService.getPostById(id).getCook());
        List<Category> all = categoryService.findAllByOrderByRunameAsc();
        IndexController.IndexControllerUtility utility = new IndexControllerUtility();
        String cookUser = utility.getCookUser(request);
        model.addAttribute("categories", all);
        model.addAttribute("key", andSetCook);
        model.addAttribute("post", postService.getPostById(id));
        model.addAttribute("userCook", cookUser);
//        Logger logger = LoggerFactory.getLogger(this.getClass());
//        logger.warn("Hello");
        return "post";
    }

    @GetMapping(path = "/{error}")
    public String errorPage(@PathVariable("error") String error) {
        return "redirect:/";
    }

    static class IndexControllerUtility {
        String getCookUser(HttpServletRequest request) {
            Cookie[] cookies = request.getCookies();
            String cook;
            try {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("VALKEY")) {
                        cook = cookie.getValue();
                        return cook;
                    }
                }
            } catch (NullPointerException e) {
                return "false";
            }
            return "false";
        }
    }
}
