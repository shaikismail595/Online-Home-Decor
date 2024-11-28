<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            background-image: url('https://www.example.com/path-to-your-background-image.jpg'), var(--gold-shimmer);
            background-size: cover, 200%;
            background-position: center;
            animation: shimmer 3s infinite alternate;
            font-family: 'Poppins', sans-serif;
            color: var(--primary-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            padding: 80px 0 50px;
            background-color: var(--light-bg);
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
            background-color: rgb(254 249 242);
            padding: 1rem 0;
            text-align: center;
            color: var(--primary-color);
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .hero {
            text-align: center;
            padding: 2rem;
            background-color: var(--light-bg);
            border-radius: 8px;
            margin: 1rem auto;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in;
        }

        .hero h1 {
            font-size: 2rem;
            color: var(--gold-color);
        }

        .hero p {
            font-size: 1rem;
            color: var(--primary-color);
        }

        .container {
            flex: 1;
            max-width: 800px;
            margin: 1.5rem auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(216, 164, 68, 0.5);
        }

        h2 {
            font-family: 'Playfair Display', serif;
            color: var(--gold-color);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
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
            background-color: #f2 f2f2;
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

        .btn-warning {
            background-color: var(--gold-shade-light);
            border: none;
            color: white;
        }

        .btn-warning:hover {
            background-color: var(--gold-shade-dark);
        }

        .btn-danger {

            background-color: var(--gold-shade-dark);
            border: none;
            color: white;
        }

        .btn-danger:hover {
            background-color: #a67c2b;
        }

        .btn-success {
            background-color: var(--gold-shade-light);
            border: none;
            color: white;
        }

        .btn-success:hover {
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

            .hero h1 {
                font-size: 1.5rem;
            }

            .hero p {
                font-size: 0.9rem;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>

<header>
    <jsp:include page="/WEB-INF/view/include/header.jsp" />
</header>

<div class="container mt-5">
    <div class="hero">
        <h1>Your Shopping Cart</h1>
        <p>Review your selected items before proceeding to checkout</p>
    </div>

    <c:if test="${not empty cartItems}">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/cart/update/${item.cartId}" method="post" class="d-flex align-items-center">
                            <button type="button" class="btn btn-quantity" onclick="decreaseQuantity(${item.cartId})">-</button>
                            <input type="number" name="quantity" value="${item.quantity}" class="quantity-input" min="1" readonly data-cart-id="${item.cartId}"/>
                            <button type="button" class="btn btn-quantity" onclick="increaseQuantity(${item.cartId})">+</button>
                        </form>
                    </td>
                    <td>${item.productPrice}</td>
                    <td class="total-price" data-cart-id="${item.cartId}">${item.quantity * item.productPrice}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/cart/remove/${item.cartId}" method="post">
                            <button type="submit" class="btn btn-danger">Remove</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <form action="${pageContext.request.contextPath}/cart/clear" method="post">
            <button type="submit" class="btn btn-warning">Clear Cart</button>
        </form>

        <h4 class="mt-4">Total Amount:
            <c:set var="totalAmount" value="0" />
            <c:forEach var="item" items="${cartItems}">
                <c:set var="totalAmount" value="${totalAmount + (item.quantity * item.productPrice)}" />
            </c:forEach>
            ${totalAmount}
        </h4>
        <form action="${pageContext.request.contextPath}/cart/checkout" method="get">
            <button type="submit" class="btn btn-success">Checkout</button>
        </form>

    </c:if>

    <c:if test="${empty cartItems}">
        <div class="alert alert-info">Your cart is empty!</div>
    </c:if>

    <a href="${pageContext.request.contextPath}/users/product/list" class="btn btn-warning mt-4">Continue Shopping</a>
</div>

<footer>
    <jsp:include page="/WEB-INF/view/include/footer.jsp" />
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function increaseQuantity(cartId) {
        const input = document.querySelector(`input[name='quantity'][data-cart-id='${cartId}']`);
        let currentValue = parseInt(input.value);
        input.value = currentValue + 1;
        updateTotal(cartId);
    }

    function decreaseQuantity(cartId) {
        const input = document.querySelector(`input[name='quantity'][data-cart-id='${cartId}']`);
        let currentValue = parseInt(input.value);
        if (currentValue > 1) {
            input.value = currentValue - 1;
            updateTotal(cartId);
        }
    }

    function updateTotal(cartId) {
        const input = document.querySelector(`input[name='quantity'][data-cart-id='${cartId}']`);
        const quantity = parseInt(input.value);
        const price = parseFloat(document.querySelector(`tr:nth-child(${cartId + 1}) td:nth-child(3)`).innerText);
        const totalCell = document.querySelector(`.total-price[data-cart-id='${cartId}']`);
        totalCell.innerText = (quantity * price).toFixed(2);
    }
</script>
</body>
</html>