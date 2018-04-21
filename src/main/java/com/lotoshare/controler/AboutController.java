package com.lotoshare.controler;

import com.lotoshare.entity.Category;
import com.lotoshare.entity.Massage;
import com.lotoshare.service.CategoryService;
import com.lotoshare.service.MassageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(path = "/about")
public class AboutController {
    private CategoryService categoryService;
    private MassageService massageService;

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setMassageService(MassageService massageService){
        this.massageService = massageService;
    }

    @GetMapping
    public String about(Model model) {
        List<Category> all = categoryService.findAllByOrderByRunameAsc();
        Massage massageById = massageService.getMassageById(3);
        model.addAttribute("massageAbout", massageById.getMassage());
        model.addAttribute("categories", all);
        model.addAttribute("title", "О проекте");
        return "about";
    }
}
