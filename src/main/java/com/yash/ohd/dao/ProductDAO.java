package com.yash.ohd.dao;

import com.yash.ohd.domain.Product;

import java.util.List;

public interface ProductDAO {
    void save(Product product);
    void update(Product product);
    void delete(Integer productId);
    Product findById(Integer productId);
    List<Product> findAll();
}