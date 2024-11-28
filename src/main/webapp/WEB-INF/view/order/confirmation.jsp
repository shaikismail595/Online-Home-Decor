<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --accent-color: #e67e22;
            --gold-color: #D8A444;
            --light-bg: #f9f9f9;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding-top: 80px;
            padding-bottom: 50px;
            background-color: var(--light-bg);
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
            margin-bottom: 1rem;
            text-align: center;
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

            .container {
                padding: 1rem;
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
    <h2>Thank you for your order!</h2>
    <p>Your order has been successfully placed and is being processed. We will notify you once it's shipped.</p>
    <a href="${pageContext.request.contextPath}/users/product/list" class="btn btn-primary">Continue Shopping</a>
</div>

<footer>
        <jsp:include page="/WEB-INF/view/include/footer.jsp" />
    </footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap .min.js"></script>
</body>
</html>