package com.yash.ohd.controller;

import com.yash.ohd.dao.CartDAO;
import com.yash.ohd.domain.CartItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartDAO cartDAO;

    @PostMapping("/add")
    public String addToCart(@RequestParam("userId") int userId,
                            @RequestParam("productId") int productId,
                            @RequestParam("quantity") int quantity) {
        try {
            cartDAO.addToCart(userId, productId, quantity);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "redirect:/users/product/list"; // Redirect to product list or wherever appropriate
    }

    @GetMapping("/view")
    public String viewCart(HttpSession session, Model model) {
        int userId = (int) session.getAttribute("userId"); // Assuming user ID is stored in session
        List<CartItem> cartItems = null;
        try {
            cartItems = cartDAO.getCartItems(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("cartItems", cartItems);
        return "cart/view"; // Return the view name for displaying cart items
    }

    @PostMapping("/remove/{cartId}")
    public String removeFromCart(@PathVariable int cartId) {
        try {
            cartDAO.removeFromCart(cartId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cart/view"; // Redirect to the view cart page
    }

    @PostMapping("/clear")
    public String clearCart(HttpSession session) {
        int userId = (int) session.getAttribute("userId"); // Assuming user ID is stored in session
        try {
            cartDAO.clearCart(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "redirect:/cart/view"; // Redirect to the view cart page
    }

    @GetMapping("/checkout")
    public String checkout(HttpSession session, Model model) {
        int userId = (int) session.getAttribute("userId"); // Assuming user ID is stored in session
        List<CartItem> cartItems = null;
        try {
            cartItems = cartDAO.getCartItems(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        double totalAmount = cartItems.stream().mapToDouble(item -> item.getProductPrice() * item.getQuantity()).sum();

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalAmount", totalAmount);
        return "cart/checkout"; // Return the checkout view name
    }

}