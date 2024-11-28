package com.yash.ohd.dao;

import com.yash.ohd.domain.CartItem;

import java.sql.SQLException;
import java.util.List;

public interface CartDAO {
    void addToCart(int userId, int productId, int quantity) throws SQLException;
    List<CartItem> getCartItems(int userId) throws SQLException;
    void removeFromCart(int cartId) throws SQLException;
    void clearCart(int userId) throws SQLException;
}