package com.yash.ohd.dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import com.yash.ohd.domain.CartItem;
import com.yash.ohd.domain.Order;
import com.yash.ohd.rm.OrderRowMapper;
import com.yash.ohd.rm.OrderWithProductRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAOImpl extends BaseDAO implements OrderDAO {

    @Override
    public void saveOrder(int userId, String address, String paymentMethod, double totalAmount, List<CartItem> cartItems) {
        // Set the status and calculate the estimated delivery date as 3 days from now
        String status = "Processing";
        LocalDateTime estimatedDeliveryDate = LocalDateTime.now().plusDays(3);
        Timestamp estimatedDelivery = Timestamp.valueOf(estimatedDeliveryDate);

        // Insert the main order details into the Orders table
        String orderSql = "INSERT INTO `Orders` (user_id, address, payment_method, total_price, status, estimated_delivery) " +
                "VALUES (:userId, :address, :paymentMethod, :totalAmount, :status, :estimatedDelivery)";

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("userId", userId);
        params.addValue("address", address);
        params.addValue("paymentMethod", paymentMethod);
        params.addValue("totalAmount", totalAmount);
        params.addValue("status", status);
        params.addValue("estimatedDelivery", estimatedDelivery);

        // Use KeyHolder to retrieve the generated order_id
        KeyHolder keyHolder = new GeneratedKeyHolder();
        super.getNamedParameterJdbcTemplate().update(orderSql, params, keyHolder, new String[]{"order_id"});
        int orderId = keyHolder.getKey().intValue();

        // Insert each cart item into the OrderItems table with the retrieved order_id
        String orderItemSql = "INSERT INTO `OrderItems` (order_id, product_id, vendor_id, quantity, price) " +
                "VALUES (:orderId, :productId, :vendorId, :quantity, :price)";
        for (CartItem cartItem : cartItems) {
            MapSqlParameterSource itemParams = new MapSqlParameterSource();
            itemParams.addValue("orderId", orderId);
            itemParams.addValue("productId", cartItem.getProductId());
            itemParams.addValue("vendorId", cartItem.getVendorId());
            itemParams.addValue("quantity", cartItem.getQuantity());
            itemParams.addValue("price", cartItem.getProductPrice());

            super.getNamedParameterJdbcTemplate().update(orderItemSql, itemParams);
        }
    }

    @Override
    public List<Order> getOrdersByVendorId(int vendorId) {
        String sql = "SELECT DISTINCT o.* " +
                "FROM orders o " +
                "JOIN orderitems oi ON o.order_id = oi.order_id " +
                "WHERE oi.vendor_id = ?";
        return super.getJdbcTemplate().query(sql, new Object[]{vendorId}, new OrderRowMapper());
    }

    @Override
    public void updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        super.getJdbcTemplate().update(sql, status, orderId);
    }

    @Override
    public List<Order> findOrderByUserId(int userId) {
        // SQL query to fetch orders by userId
        String sql = "SELECT * FROM orders WHERE user_id = ?";
        // Query the database and map the results to the Order objects
        return super.getJdbcTemplate().query(sql, new Object[]{userId}, new OrderRowMapper());
    }

    @Override
    public List<Order> getAllOrders() {
        String sql = "SELECT * FROM Orders";
        return super.getJdbcTemplate().query(sql, new OrderRowMapper());
    }

    @Override
    public List<Order> getAllOrdersWithProducts() {
        String sql = "SELECT o.order_id, o.user_id, o.address, o.payment_method, o.total_price, o.status, o.estimated_delivery, " +
                "p.productId, p.name, p.price " +
                "FROM Orders o " +
                "JOIN Product p ON o.product_id = p.productId";
        return super.getJdbcTemplate().query(sql, new OrderWithProductRowMapper());
    }


}
