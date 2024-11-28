<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List - Vendor Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <s:url var="url_css" value="/static/css/style.css"/>
    <link href="${url_css}" rel="stylesheet" type="text/css"/>
    <style>
        :root {
            --primary-color: #2c3e50;
            --accent-color: #e67e22;
            --gold-color: #D8A444;
            --light-bg: #f9f9f9;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 14px;
            padding-top: 80px; /* Height of the header */
            padding-bottom: 50px; /* Height of the footer */
            background-color: var(--light-bg);
        }

        header {
                    position: fixed;
                    top: 0;
                    left: 0;
                    right: 0;
                    z-index: 1000;
                    background-color: rgba(255, 255, 255, 0.8);
                    padding: 0.2rem 0;
                    text-align: center;
                    color: var(--primary-color);
                    font-family: 'Playfair Display', serif;
                    font-size: 1.2rem;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);

                }

        .container {
            flex: 1;
            max-width: 1200px;
            margin: 1.5rem auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(216, 164, 68, 0.5);
            border: 2px solid var(--gold-color);
        }

        h1 {
            font-family: 'Playfair Display', serif;
            color: var(--gold-color);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .table {
            border-collapse: separate;
            border-spacing: 0;
        }

        .table th, .table td {
            border: 1px solid var(--gold-color);
            padding: 1rem;
            text-align: center;
        }

        .table th {
            background-color: var(--accent-color);
            color: white;
        }

        .table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table tbody tr:hover {
            background-color: #e0e0e0;
        }

        .scrollable-table {
            max-height: 400px; /* Set a max height for the scroll */
            overflow-y: auto; /* Enable vertical scrolling */
        }

        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 1000; /* Make sure it stays on top */
            background-color: rgba(255, 255, 255 , 0.8);
            padding: 0.2rem 0; /* Reduced padding for a smaller footer */
            text-align: center;
            color: #000000;
            font-size: 0.6rem; /* Reduced font size */
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .back-button {
            margin-bottom: 1rem;
            display: block;
            text-align: center;
        }

        .btn-primary {
            color: #fff;
            background-color: #be8400;
            border-color: #000000;
        }

        @media (max-width: 768px) {
            .container {
                max-width: 90%;
                padding: 1.5rem;
            }

            h1 {
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

            h1 {
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
        <h1 class="mb-4">Product List</h1>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary back-button">Back to Admin Dashboard</a>
        <div class="scrollable-table">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.productId}</td>
                            <td><img src="${pageContext.request.contextPath}/${product.imagePath}" alt="Product Image" style="width: 100px; height: auto;"></td>
                            <td>${product.name}</td>
                            <td>${product.description}</td>
                            <td>${product.price}</td>
                            <td>${product.stock}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/product/edit/${product.productId}" class="btn btn-warning btn-sm">Edit</a>
                                <a href="${pageContext.request.contextPath}/product/delete/${product.productId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <footer>
        <jsp:include page="/WEB-INF/view/include/footer.jsp" />
    </footer>
</body>
</html>