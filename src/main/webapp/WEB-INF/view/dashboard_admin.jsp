<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Home Decor Application</title>
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
            --text-color: #333333; /* New variable for text color */
            --gold-shimmer:linear-gradient(45deg, rgba(216, 164, 68, 0.8), rgba(255, 223, 186, 0.8)); /* Example shimmer */
        }

        body {
            background-image: url('https://www.example.com/path-to-your-background-image.jpg'), var(--gold-shimmer);
            background-size: cover, 200%;
            background-position: center;
            animation: shimmer 3s infinite alternate;
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            font-size: 14px;
            padding: 80px 0 50px;
            background-color: var(--light-bg);
            overflow-x: hidden;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000; /* Make sure it stays on top */
            background-color: rgb(254 249 242);
            padding: 1rem 0;
            text-align: center;
            color: var(--primary-color);
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .menu {
            display: flex;
            justify-content: space-between; /* Space between Welcome and menu buttons */
            align-items: center; /* Align items vertically in the center */
            background-color: rgba(255, 255, 255, 0.8);
            padding: 1rem;
            margin-top: 1px;
        }

        .menu-left {
            font-size: 1rem;
            font-weight: 500;
            color: var(--primary-color);
        }

        .menu-right a {
            color: var(--gold-color);
            text-decoration: none;
            padding: 0.5rem 1rem;
            margin: 0 0.2rem;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .menu-right a:hover {
            color: #b59430;
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

        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 4rem;
            margin: 1rem;
        }

        .category-card {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 8px;
            padding: 1rem;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .category-card:hover {
            transform: scale(1.05);
        }

        .category-card i {
            font-size: 2rem;
            color: var(--gold-color);
        }

        .category-card h3 {
            font-size: 1.2rem;
            color: var(--primary-color);
            margin: 0.5rem 0;
        }

        .category-card p {
            font-size: 0.9rem;
            color: var(--primary-color);
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
            header, footer {
                width: 90%;
            }

            .hero {
                font-size: 1.5rem;
            }

            .category-card {
                padding: 0.5rem;
            }

            .category-card h3 {
                font-size: 1rem;
            }

            .category-card p {
                font-size: 0.8rem;
            }
        }

        @media (max-width: 480px) {
            body {
                font-size: 12px;
            }

            .hero h1 {
                font-size: 1.5rem;
            }

            .hero p {
                font-size: 0.9rem;
            }

            .category-card {
                padding: 0.5rem;
            }

            .category-card h3 {
                font-size: 0.9rem;
            }

            .category-card p {
                font-size: 0.7rem;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes shimmer {
            0% { background-position: 0% 0%; }
            100% { background-position: 100% 0%; }
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="include/header.jsp"/>
    </header>

    <nav class="menu d-flex justify-content-between align-items-center">
        <!-- Left side: Welcome Message -->
        <div class="menu-left">
            <c:if test="${not empty sessionScope.username}">
                <span>Welcome, ${sessionScope.username}</span>
            </c:if>
            <c:if test="${empty sessionScope.username}">
                <span>Welcome, Guest</span>
            </c:if>
        </div>

        <!-- Right side: Menu Links -->
        <div class="menu-right">

<s:url var="url_logout" value="/logout"/>
        <c:if test="${sessionScope.userId == null}">
                <%-- Guest Menu --%>


                <a href="#"><i class="fas fa-home"></i> Home</a> |
                <a href="<s:url value='/index'/>"><i class="fas fa-sign-in-alt"></i> Login</a> |
                <a href="<s:url value='/reg_form'/>"><i class="fas fa-user-plus"></i> Register</a> |
                <a href="#"><i class="fas fa-info-circle"></i> About</a> |
                <a href="#"><i class="fas fa-question-circle"></i> Help</a>
            </c:if>
            <c:if test="${sessionScope.userId != null && sessionScope.role == 1}">
                <%-- Admin Menu --%>

                <a href="<s:url value='/admin/dashboard'/>"><i class="fas fa-home"></i> Home</a> |
                <a href="<s:url value='/admin/users'/>"><i class="fas fa-users"></i> User List</a> |
                <a href="<s:url value='/admin/vendors'/>"><i class="fas fa-users"></i> Vendor List</a> |
                <a href="<s:url value='/product/admin'/>"><i class="fas fa-users"></i> Product List</a> |
                <a href="<s:url value='/admin/orders'/>"><i class="fas fa-receipt"></i> Order List</a> |
                <a href="${url_logout}"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </c:if>
            <c:if test="${sessionScope.userId != null && sessionScope.role == 2}">
                <%-- User Menu --%>
                <a href="<s:url value='/user/dashboard'/>"><i class="fas fa-home"></i> Home</a> |
                <a href="<s:url value='/users/product/list'/>"><i class="fas fa-list"></i> Product List</a> |
                <a href="${url_logout}"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </c:if>
            <c:if test="${sessionScope.userId != null && sessionScope.role == 3}">
                <%-- Vendor Menu --%>
                <a href="<s:url value='/vendor/dashboard'/>"><i class="fas fa-home"></i> Home</a> |

                <a href="<s:url value='/product/list'/>"><i class="fas fa-list"></i> Product List</a> |
                <a href="${url_logout}"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </c:if>

        </div>
    </nav>





    <div class="container">
        <div class="hero">
            <h1>Manage Your Home Decor Application</h1>
            <p>Welcome to the Admin Dashboard.
        </div>

        <div class="category-grid">
            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-users"></i>
                    <h3>User Management</h3>
                    <p>View and manage user accounts and permissions.</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-box-open"></i>
                    <h3>Product Management</h3>
                    <p>Add, edit, or remove products from the catalog.</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-chart-line"></i>
                    <h3>Sales Reports</h3>
                    <p>Analyze sales data and generate reports.</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-cogs"></i>
                    <h3>Settings</h3>
                    <p>Configure application settings and preferences.</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-comments"></i>
                    <h3>Feedback</h3>
                    <p>Review user feedback and improve the application experience.</p>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <jsp:include page="include/footer.jsp"/>
    </footer>
</body>
</html>