package com.yash.ohd.dao;

import com.yash.ohd.domain.CartItem;
import com.yash.ohd.rm.CartRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDAOImpl extends BaseDAO implements CartDAO {

    @Override
    public void addToCart(int userId, int productId, int quantity) {
        String sql = "INSERT INTO Cart (user_id, product_id, quantity) VALUES (:userId, :productId, :quantity) " +
                "ON DUPLICATE KEY UPDATE quantity = quantity + :quantity";
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("productId", productId);
        params.put("quantity", quantity);

        SqlParameterSource ps = new MapSqlParameterSource(params);
        super.getNamedParameterJdbcTemplate().update(sql, ps);
    }

    @Override
    public List<CartItem> getCartItems(int userId) {
        String sql = "SELECT c.cart_id, c.product_id, c.quantity, p.name, p.price " +
                "FROM Cart c JOIN Product p ON c.product_id = p.productId " +
                "WHERE c.user_id = :userId";
        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("userId", userId);

        return super.getNamedParameterJdbcTemplate().query(sql, params, new CartRowMapper());
    }

    @Override
    public void removeFromCart(int cartId) {
        String sql = "DELETE FROM Cart WHERE cart_id = ?";
        getJdbcTemplate().update(sql, cartId);
    }

    @Override
    public void clearCart(int userId) {
        String sql = "DELETE FROM Cart WHERE user_id = ?";
        getJdbcTemplate().update(sql, userId);
    }
}