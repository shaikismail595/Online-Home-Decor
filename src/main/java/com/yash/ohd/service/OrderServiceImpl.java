package com.yash.ohd.service;

import com.yash.ohd.dao.CartDAO;
import com.yash.ohd.dao.OrderDAO;
import com.yash.ohd.domain.CartItem;
import com.yash.ohd.domain.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;


@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private CartDAO cartDAO;

    @Autowired
    private OrderDAO orderDAO;

    @Override
    public void createOrder(int userId, String address, String paymentMethod) {
        // Fetch cart items for the user
        List<CartItem> cartItems = null;
        try {
            cartItems = cartDAO.getCartItems(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        double totalAmount = cartItems.stream()
                .mapToDouble(item -> item.getProductPrice() * item.getQuantity())
                .sum();

        // Save the order and clear the cart
        orderDAO.saveOrder(userId, address, paymentMethod, totalAmount, cartItems);
        try {
            cartDAO.clearCart(userId); // Clear the cart after placing order
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Order> getAllOrdersByVendorId(int vendorId) {
        return orderDAO.getOrdersByVendorId(vendorId);
    }

    @Override
    public void updateOrderStatus(int orderId, String status) {
        orderDAO.updateOrderStatus(orderId, status);
    }
    @Override
    public List<Order> getAllOrdersByUserId(int userId) {
        // Logic to fetch orders for a specific user from the database
        return orderDAO.findOrderByUserId(userId); // Example
    }
    @Override
    public List<Order> getAllOrders() {
        return orderDAO.getAllOrders();
    }
    @Override
    public List<Order> getAllOrdersWithProducts() {
        return orderDAO.getAllOrdersWithProducts();
    }


}
