package com.yash.ohd.dao;

import com.yash.ohd.domain.CartItem;
import com.yash.ohd.domain.Order;

import java.util.List;

public interface OrderDAO {
    void saveOrder(int userId, String address, String paymentMethod, double totalAmount, List<CartItem> cartItems);

    List<Order> getOrdersByVendorId(int vendorId);

    void updateOrderStatus(int orderId, String status);



    List<Order> findOrderByUserId(int userId);

    List<Order> getAllOrders();

    List<Order> getAllOrdersWithProducts();
}
