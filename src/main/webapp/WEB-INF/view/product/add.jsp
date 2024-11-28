<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product - Vendor Dashboard</title>
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
            z-index: 1000; /* Make sure it stays on top */
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

        h1 {
            font-family: 'Playfair Display', serif;
            color: var(--gold-color);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        footer {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 1000; /* Make sure it stays on top */
            background-color: rgba(255, 255, 255, 0.8);
            padding: 0.2rem 0; /* Reduced padding for a smaller footer */
            text-align: center;
            color: #000000;
            font-size: 0.6rem; /* Reduced font size */
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
</head <body>
    <header>
                    <jsp:include page="/WEB-INF/view/include/header.jsp" />
        </header>

    <div class="container mt-5">
        <form action="${pageContext.request.contextPath}/product/add" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="imageFile">Product Image</label>
                <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*">
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" required></textarea>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" class="form-control" id="price" name="price" required step="0.01">
            </div>
            <div class="form-group">
                <label for="stock">Stock</label>
                <input type="number" class="form-control" id="stock" name="stock" required>
            </div>

            <button type="submit" class="btn btn-primary">Add Product</button>
            <a href="${pageContext.request.contextPath}/product/list" class="btn btn-secondary">Cancel</a>
        </form>

    </div>

    <footer>
        <jsp:include page="/WEB-INF/view/include/footer.jsp" />
    </footer>
</body>
</html>