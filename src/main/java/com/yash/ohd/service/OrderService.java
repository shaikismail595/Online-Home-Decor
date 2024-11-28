package com.yash.ohd.service;

import com.yash.ohd.domain.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {
    void createOrder(int userId, String address, String paymentMethod);

    List<Order> getAllOrdersByVendorId(int vendorId);

    void updateOrderStatus(int orderId, String status);

    List<Order> getAllOrdersByUserId(int userId);

    List<Order> getAllOrders();

    List<Order> getAllOrdersWithProducts();
}
