package com.yash.ohd.rm;

import com.yash.ohd.domain.Order;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderRowMapper implements RowMapper<Order> {
    @Override
    public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
        Order order = new Order();
        order.setOrderId(rs.getInt("order_id"));
        order.setUserId(rs.getInt("user_id"));
        order.setOrderDate(rs.getTimestamp("order_date"));
        order.setTotalPrice(rs.getDouble("total_price"));
        order.setPaymentMethod(rs.getString("payment_method"));
        order.setAddress(rs.getString("address"));
        order.setStatus(rs.getString("status"));
        order.setEstimatedDelivery(rs.getTimestamp("estimated_delivery"));
        return order;
    }
}
