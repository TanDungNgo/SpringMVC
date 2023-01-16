package com.springMVC.demo.controllers;

import com.springMVC.demo.models.Category;
import com.springMVC.demo.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "categories")
//http:localhost:8080/categories
public class CategoryController {
    @Autowired // Inject "categoryRepository" - Dependency Injection
    private CategoryRepository categoryRepository;
    //return name of "jsp file"
    //http:localhost:8080/categories
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String getAllCategories(ModelMap modelMap)
    {
        //data sent to jsp => ModelMap
        //send data from controller to view
        Iterable<Category> categories = categoryRepository.findAll();
        modelMap.addAttribute("categories", categories);
        return "category";
    }
}
