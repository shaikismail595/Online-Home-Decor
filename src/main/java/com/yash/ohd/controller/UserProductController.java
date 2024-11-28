package com.yash.ohd.controller;

import com.yash.ohd.dao.ProductDAO;
import com.yash.ohd.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/users/product")
public class UserProductController {

    @Autowired
    private ProductDAO productDAO;

    @GetMapping("/list")
    public String listProducts(Model model) {
        List<Product> products = productDAO.findAll();
        for (Product product : products) {
            System.out.println(product.getName());
        }
        model.addAttribute("products", products);
        return "users/product/list"; // Return the view name for the user product listing
    }
}