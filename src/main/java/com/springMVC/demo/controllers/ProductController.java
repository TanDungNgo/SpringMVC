package com.springMVC.demo.controllers;

import com.springMVC.demo.models.Category;
import com.springMVC.demo.models.Product;
import com.springMVC.demo.repositories.CategoryRepository;
import com.springMVC.demo.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
@RequestMapping(path = "products")
public class ProductController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    @RequestMapping(value = "/getProductsByCategoryID/{categoryID}", method = RequestMethod.GET)
    public String getProductsByCategoryID(ModelMap modelMap, @PathVariable int categoryID) {
        Iterable<Product> products = productRepository.findByCategoryID(categoryID);
        modelMap.addAttribute("products", products);
        return "productList";
    }

    @RequestMapping(value = "insertProduct", method = RequestMethod.GET)
    public String insertProduct(ModelMap modelMap) {
        modelMap.addAttribute("product", new Product());
        modelMap.addAttribute("categories", categoryRepository.findAll());
        return "insertProduct";
    }

    @RequestMapping(value = "insertProduct", method = RequestMethod.POST)
    public String insertProduct(ModelMap modelMap, @Valid @ModelAttribute("product") Product product,
                                BindingResult bindingResult) {
        if(bindingResult.hasErrors())
        {
            modelMap.addAttribute("categories", categoryRepository.findAll());
            return "insertProduct";
        }
        try {
            productRepository.save(product);
            return "redirect:/categories";
        }
        catch (Exception e)
        {
            modelMap.addAttribute("categories", categoryRepository.findAll());
            return "insertProduct";
        }
    }

    @RequestMapping(value = "/changeCategory/{productID}", method = RequestMethod.GET)
    public String changeCategory(ModelMap modelMap, @PathVariable int productID) {
        Iterable<Category> categories = categoryRepository.findAll();
        modelMap.addAttribute("categories", categories);
        modelMap.addAttribute("product", productRepository.findById(productID).get());
        return "updateProduct";
    }

    @RequestMapping(value = "/deleteProduct/{productID}", method = RequestMethod.GET)
    public String deleteProduct(ModelMap modelMap, @PathVariable int productID) {
        Product product = productRepository.findById(productID).get();
        try
        {
            productRepository.deleteById(productID);
        }
        catch (Exception e)
        {
            return "redirect:/products/getProductsByCategoryID/" + product.getCategoryID();
        }
        return "redirect:/products/getProductsByCategoryID/" + product.getCategoryID();
    }

    @RequestMapping(value = "/updateProduct/{productID}", method = RequestMethod.POST)
    public String updateProduct(ModelMap modelMap,
                                @Valid @ModelAttribute("product") Product product,
                                BindingResult bindingResult,
                                @PathVariable int productID
    ) {
        if (bindingResult.hasErrors()) {
            modelMap.addAttribute("categories", categoryRepository.findAll());
            return "updateProduct";
        }
        try {
            if (productRepository.findById(productID).isPresent()) {
                Product foundProduct = productRepository
                        .findById(product.getProductID()).get();
                if (!product.getProductName().trim().isEmpty()) {
                    foundProduct.setProductName(product.getProductName());
                }
                if (product.getCategoryID() > 0) {
                    foundProduct.setCategoryID(product.getCategoryID());
                }
                //is empty => "" OR NULL
                if (!product.getDescription().trim().isEmpty()) {
                    foundProduct.setDescription(product.getDescription());
                }
                if (product.getPrice() > 0) {
                    foundProduct.setPrice(product.getPrice());
                }
                productRepository.save(foundProduct);
            }
        } catch (Exception e) {
            modelMap.addAttribute("categories", categoryRepository.findAll());
            return "updateProduct";
        }
        return "redirect:/products/getProductsByCategoryID/" + product.getCategoryID();
    }


}
