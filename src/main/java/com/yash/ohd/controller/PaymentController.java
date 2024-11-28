package com.yash.ohd.controller;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import org.json.JSONObject;

public class PaymentController {
    public String createOrder(int amount, String currency) {
        try {
            RazorpayClient razorpay = new RazorpayClient("YOUR_KEY_ID", "YOUR_KEY_SECRET");

            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", amount * 100); // Amount in smallest currency unit (e.g., paise for INR)
            orderRequest.put("currency", currency);
            orderRequest.put("receipt", "txn_123456");

            Order order = razorpay.orders.create(orderRequest);
            return order.get("id"); // Return the Razorpay Order ID
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
