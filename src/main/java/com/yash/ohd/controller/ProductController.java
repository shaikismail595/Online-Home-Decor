package com.yash.ohd.controller;

import com.yash.ohd.dao.ProductDAO;
import com.yash.ohd.domain.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.MultipartFilter;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductDAO productDAO;

    @GetMapping("/list")
    public String listProducts(Model model) {
        List<Product> products = productDAO.findAll();
        model.addAttribute("products", products);
        return "product/list";
    }

    @GetMapping("/admin")
    public String listAllProducts(Model model) {
        List<Product> products = productDAO.findAll();
        model.addAttribute("products", products);
        return "/products";
    }
    @Configuration
    public class UploadConfig {

        @Bean
        public CommonsMultipartResolver multipartResolver() {
            CommonsMultipartResolver multipart = new CommonsMultipartResolver();
            multipart.setMaxUploadSize(20 * 1024 * 1024);
            return multipart;
        }

        @Bean
        public MultipartFilter multipartFilter() {
            MultipartFilter multipartFilter = new MultipartFilter();
            multipartFilter.setMultipartResolverBeanName("multipartResolver");
            return multipartFilter;
        }
    }

    @GetMapping("/add")
    public String showAddProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "product/add";
    }


    @PostMapping("/add")
    public String addProduct(
            @ModelAttribute Product product,
            @RequestParam("imageFile") MultipartFile imageFile,
            HttpSession session) {
        Integer vendorId = (Integer) session.getAttribute("userId");
        product.setVendorId(vendorId);
        if (imageFile == null || imageFile.isEmpty()) {
            System.out.println("File upload failed. Image file is required.");
        }
        // Save image and set the path
        String imagePath = saveImage(imageFile);
        product.setImagePath(imagePath);

        productDAO.save(product);
        return "redirect:/product/list";
    }

    private String saveImage(MultipartFile imageFile) {
        try {
            if (!imageFile.isEmpty()) {
                String uploadDir = "C:/Users/ismail.shaik/Desktop/NEW-OHD/OHDApplication/OHDApplication/src/main/webapp/uploads/"; // Change to your desired directory
                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                Path filePath = Paths.get(uploadDir + fileName);
                Files.createDirectories(filePath.getParent());
                Files.write(filePath, imageFile.getBytes());
                return "/uploads/" + fileName; // Return relative path for web access
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }




    @GetMapping("/edit/{id}")
    public String showEditProductForm(@PathVariable("id") Integer productId, Model model) {
        Product product = productDAO.findById(productId);
        model.addAttribute("product", product);
        return "product/edit";
    }

    @PostMapping("/edit")
    public String updateProduct(
            @ModelAttribute Product product,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            HttpSession session) {

        Integer vendorId = (Integer) session.getAttribute("userId");
        product.setVendorId(vendorId);

        if (imageFile != null && !imageFile.isEmpty()) {
            // Save the new image and set the new path
            String newImagePath = saveImage(imageFile);
            product.setImagePath(newImagePath);
        } else {
            // Keep the old image path
            Product existingProduct = productDAO.findById(product.getProductId());
            if (existingProduct != null) {
                product.setImagePath(existingProduct.getImagePath());
            }
        }

        productDAO.update(product);
        return "redirect:/product/list";
    }


    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") Integer productId) {
        productDAO.delete(productId);
        return "redirect:/product/list";
    }
}
