<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <style>
        :root {
            --primary-color: #2c3e50;
            --accent-color: #e67e22;
            --gold-color: #D8A444;
            --gold-shade-light: #f1c40f; /* Light golden shade */
            --gold-shade-dark: #b59430; /* Darker golden shade */
            --light-bg: #f9f9f9;
            --gold-shimmer: linear-gradient(45deg, rgba(216, 164, 68, 0.8), rgba(255, 223, 186, 0.8));
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            padding-top: 80px;
            padding-bottom: 50px;
            background-image: url('https://www.example.com/path-to-your-background-image.jpg'), var(--gold-shimmer);
            background-size: cover, 200%;
            background-position: center;
            animation: shimmer 3s infinite alternate;
            color: var(--primary-color);
        }

        @keyframes shimmer {
            0% { background-position: 0% 0%; }
            100% { background-position: 100% 100%; }
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 0.75rem 0;
            text-align: center;
            color: var(--primary-color);
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .container {
            flex: 1;
            max-width: 800px;
            margin: 1.5rem auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(216, 164, 68, 0.5);
            border: 2px solid var(--gold-color);
        }

        h2 {
            font-family: 'Playfair Display', serif;
            color: var(--gold-color);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        h4 {
            color: var(--gold-color);
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        th, td {
            text-align: center;
            padding: 1rem;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #e0e0e0;
        }

        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 0.2rem 0;
            text-align: center;
            color: #000000;
            font-size: 0.6rem;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .btn-primary {
            background-color: var(--gold-shade-light);
            border: none;
            color: white;
        }

        .btn-primary:hover {
            background-color: var(--gold-shade-dark);
        }

        .btn-success {
            background-color: var(--gold-shade-light);
            border: none;
            color: white;
        }

        .btn-success:hover {
            background-color: var(--gold-shade-dark);
        }

        .btn-secondary {
            background-color: var(--gold-color);
            border: none;
            color: white;
        }

        .btn-secondary:hover {
            background-color: var(--gold-shade-dark);
        }

        @media (max-width: 768px) {
            .container {
                max-width: 90%;
                padding: 1.5rem;
            }

            h2 {
                font-size: 2rem;
            }
        }

        @media (max-width: 480px) {
            body {
                font-size: 13px;
            }

            h2 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/view/include/header.jsp" />
</header>

<div class="container mt-5">
    <h2>Checkout</h2>
    <h4>Order Summary</h4>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.quantity}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.quantity * item.productPrice}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <h4>Total Amount: ${totalAmount}</h4>

    <!-- Payment Method Selection -->
    <form id="payment-form" action="${pageContext.request.contextPath}/order/place" method="post">
        <div class="form-group">
            <label for="address">Shipping Address</label>
            <textarea class="form-control" id="address" name="address" required></textarea>
        </div>

        <div class="form-group">
            <label>Payment Method</label><br>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="upi" value="UPI" required>
                <label class="form-check-label" for="upi">UPI</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="paymentMethod" id="cod" value="Cash on Delivery" required>
                <label class="form-check-label" for="cod">Cash on Delivery</label>
            </div>
        </div>
<button type="submit" class="btn btn-primary">Place Order</button>
        <!-- Razorpay Payment Button -->
        <button type="button" id="razorpay-button" class="btn btn-primary">Pay with Razorpay</button>
    </form>


    <div class="mt-3">
        <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-secondary">View Cart</a>
        <a href="${pageContext.request.contextPath}/users/product/list" class="btn btn-success">Continue Shopping</a>
    </div>
</div>

<footer>
    <jsp:include page="/WEB-INF/view/include/footer.jsp" />
</footer>
<script>
    const razorpayKey = "YOUR_RAZORPAY_KEY_ID"; // Replace with Razorpay Key ID
    const razorpayOrderId = "${razorpayOrderId}"; // Backend-generated Razorpay Order ID
    const amount = ${totalAmount}; // Total order amount in the smallest currency unit

    document.getElementById('razorpay-button').onclick = function(e) {
        const options = {
            key: razorpayKey,
            amount: amount * 100, // Convert to smallest currency unit (e.g., paise for INR)
            currency: "INR",
            name: "Your Store Name",
            description: "Order Payment",
            order_id: razorpayOrderId,
            handler: function(response) {
                // Handle payment success
                console.log(response);
                // Optionally, send response data to the server for verification
                document.getElementById('payment-form').submit();
            },
            prefill: {
                name: "Customer Name",
                email: "customer@example.com",
                contact: "9999999999",
            },
            theme: {
                color: "#F37254",
            },
        };

        const rzp = new Razorpay(options);
        rzp.open();
        e.preventDefault();
    };
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>