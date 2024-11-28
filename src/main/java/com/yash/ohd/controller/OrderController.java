package com.yash.ohd.controller;

import com.yash.ohd.domain.Order;
import com.yash.ohd.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/place")
    public String placeOrder(@RequestParam("address") String address,
                             @RequestParam("paymentMethod") String paymentMethod,
                             HttpSession session, Model model) {
        int userId = (int) session.getAttribute("userId");
        orderService.createOrder(userId, address, paymentMethod);

        model.addAttribute("message", "Order placed successfully!");
        return "order/confirmation"; // Redirect to an order confirmation page
    }

    // Add this method to view orders for the user
    @RequestMapping("/user/myorders")
    public String viewUserOrders(HttpSession session, Model model) {
        int userId = (int) session.getAttribute("userId");
        List<Order> orders = orderService.getAllOrdersByUserId(userId);

        model.addAttribute("orders", orders);
        return "users/myorders";  // Return the view page for user orders
    }

    @RequestMapping("/vendororders")
    public String manageOrders(HttpSession session, Model model) {
        int vendorId = (int) session.getAttribute("userId");
        List<Order> orders = orderService.getAllOrdersByVendorId(vendorId);
        model.addAttribute("orders", orders);
        System.out.println("Model attributes: " + model.asMap());

        return "vendor/orders";
    }

    @PostMapping("/updateOrderStatus")
    public String updateOrderStatus(@RequestParam("orderId") int orderId,
                                    @RequestParam("status") String status) {
        orderService.updateOrderStatus(orderId, status);
        return "redirect:/order/vendororders/";
    }

}
