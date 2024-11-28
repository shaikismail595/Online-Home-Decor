<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List - Customer View</title>
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

        .container {
            flex: 1;
            max-width: 1200px;
            margin: 1.5rem auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(216, 164, 68, 0.5);
        }

        h1 {
            font-family: 'Playfair Display', serif;
            color: var(--gold-color);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .card {
            border: 1px solid var(--gold-color);
            border-radius: 8px;
            margin-bottom: 1rem;
            background-color: rgb(255, 230, 204);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            height: 100%;
        }

        .card-body {
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
        }

        .card-title {
            color: var(--primary-color);
            font-family: 'Playfair Display', serif;
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }

        .form-control {
            border: 1px solid var(--gold-color);
            border-radius: 4px;
            padding: 0.5 rem;
            width: 80px;
            display: inline-block;
            margin-right: 0.5rem;
        }

        .btn-primary {
            background-color: var(--gold-shade-dark);
            border: none;
            color: white;
        }

        .btn-primary:hover {
            background-color: #a67c2b;
        }

        .btn-secondary {
            background-color: var(--primary-color);
            border: none;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #d35400;
        }

        .back-button {
            margin-bottom: 1rem;
            display: block;
            text-align: center;
        }

        .price-tag {
            color: var(--gold-shimmer);
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 1rem;
        }

        .card-text {
            flex-grow: 1;
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

            h1 {
                font-size: 2rem;
            }

            .row > div {
                margin-bottom: 1rem;
            }
        }

        @media (max-width: 480px) {
            body {
                font-size: 13px;
            }

            .container {
                padding: 1rem;
            }

            h1 {
                font-size: 1.8rem;
            }

            .form-control {
                width: 60px;
            }
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="/WEB-INF/view/include/header.jsp" />
    </header>

    <div class="container mt-5">
        <h1 class="mb-4">Available Products</h1>
        <a href="${pageContext.request.contextPath}/user/dashboard" class="btn btn-secondary back-button">Back to Dashboard</a>

        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/cart/view" class="btn btn-secondary">
                <i class="fas fa-shopping-cart"></i> View Cart
            </a>
        </div>
        <br>
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="${pageContext.request.contextPath}/${product.imagePath}"
                             alt="${product.name}"
                             class="card-img-top"
                             style="height: 200px; object-fit: cover;"/>
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <p class="price-tag">Price: ${product.price}</p>
                            <form action="${pageContext.request.contextPath}/cart/add" method="post" class="d-flex align-items-center mt-auto">
                                <input type="hidden" name="userId" value="${sessionScope.userId}"/>
                                <input type="hidden" name="productId" value="${product.productId}"/>
                                <div class="form-group mb-0 mr-2">
                                    <input type="number"
                                           name="quantity"
                                           value="1"
                                           min="1"
                                           max="${product.stock}"
                                           required
                                           class="form-control"/>
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-cart-plus"></i> Add to Cart
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
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