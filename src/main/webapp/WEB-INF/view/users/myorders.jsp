<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders - Home Decor Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --accent-color: #e67e22;
            --gold-color: #D8A444;
            --gold-shade-light: #f1c40f;
            --gold-shade-dark: #b59430;
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

        .container {
            flex: 1;
            max-width: 800px;
            margin: 1.5rem auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(216, 164, 68, 0.5);
        }

        h2, h1 {
            font-family: 'Playfair Display', serif;
            color: var(--gold-color);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            text-align: center;
            padding: 1rem;
            border: 1px solid #e0e0e0;
        }

        th {
            background-color: var(--gold-shade-light);
            color: white;
            font-family: 'Playfair Display', serif;
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

        .btn-warning {
            background-color: var(--gold-shade-light);
            border: none;
            color: white;
        }

        .btn-warning:hover {
            background-color: var(--gold-shade-dark);
        }

        .back-to-dashboard {
            display: block;
            width: 100%;
            margin-top: 1rem;
            text-align: center;
        }

        @media (max-width: 768px) {
            .container {
                max-width: 90%;
                padding: 1.5rem;
            }

            h1, h2 {
                font-size: 2rem;
            }
        }

        @media (max-width: 480px) {
            body {
                font-size: 13px;
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
            <h1>My Orders</h1>
            <p>View and track your recent orders</p>
        </div>

        <c:if test="${not empty orders}">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Address</th>
                        <th>Payment Method</th>
                        <th>Total Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.address}</td>
                            <td>${order.paymentMethod}</td>
                            <td>${order.totalPrice}</td>
                            <td>${order.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty orders}">
            <div class="alert alert-info text-center">You have no orders yet!</div>
        </c:if>

        <div class="back-to-dashboard">
            <s:url var="url_home" value="/users/product/list"/>
            <a href="${url_home}" class="btn btn-warning">
                <i class="fas fa-arrow-left"></i> Continue Shopping
            </a>
        </div>
    </div>

    <footer>
        <jsp:include page="/WEB-INF/view/include/footer.jsp" />
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>