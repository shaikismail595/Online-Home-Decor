package com.yash.ohd.rm;

import com.yash.ohd.domain.Order;
import com.yash.ohd.domain.Product;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderWithProductRowMapper implements RowMapper<Order> {

    @Override
    public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("order_id"));
        order.setUserId(rs.getInt("user_id"));
        order.setAddress(rs.getString("address"));
        order.setPaymentMethod(rs.getString("payment_method"));
        order.setTotalPrice(rs.getDouble("total_price"));
        order.setStatus(rs.getString("status"));
        order.setEstimatedDelivery(rs.getDate("estimated_delivery"));

        Product product = new Product();
        product.setProductId(rs.getInt("productId"));
        product.setName(rs.getString("name"));
        product.setPrice(rs.getDouble("price"));
        product.setVendorId(rs.getInt("vendor_id"));

        order.setProduct(product);
        return order;
    }
}
