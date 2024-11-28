<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="f" %> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard - Home Decor Application</title>
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
            --gold-shimmer: linear-gradient(45deg, rgba(216, 164, 68, 0.8), rgba(255, 223, 186, 0.8));
            --text-color: #34495e;
            --light-bg: #f9f9f9;
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

        .image-carousel {
            width: 100%;
            overflow: hidden;
            position: relative;
            margin: 1rem auto;
        }

        .carousel-images {
            display: flex;
            width: fit-content;
            animation: infiniteScroll 16s linear infinite;
        }

        .carousel-images img {
            width:  100%;
            height: 80%;
            border-radius: 8px;
            margin-right: 1rem;
        }

         .carousel-images img {
                width: 300px;
                height: 200px;
            }

        @keyframes infiniteScroll {
             0% {
                   transform: translateX(0);
               }
               100% {
                   transform: translateX(-50%);
               }
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 2rem;
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
    </style>
</head>
<body>
    <header>
        <jsp:include page="include/header.jsp"/>
    </header>

    <nav class="menu d-flex justify-content-between align-items-center">
    <s:url var="url_logout" value="/logout"/>
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
                    <a href="${url_logout}"><i class="fas fa-sign-out-alt"></i> Logout</a>
                </c:if>
                <c:if test="${sessionScope.userId != null && sessionScope.role == 2}">
                    <%-- User Menu --%>
                    <a href="<s:url value='/user/dashboard'/>"><i class="fas fa-home"></i> Home</a> |
                    <a href="<s:url value='/users/product/list'/>"><i class="fas fa-list"></i> Product List</a> |
                    <a href="${pageContext.request.contextPath}/cart/view" class="fas fa-cart">
                        <i class="fas fa-shopping-cart"></i> My Cart
                    </a> |
                    <a href="<s:url value='/order/user/myorders'/>"><i class="fas fa-box"></i> My Orders</a> | <!-- Add this line -->
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
            <h1>Create Your Dream Space</h1>
            <p>Discover our vibrant collection of premium home decor</p>
        </div>

        <div class="image-carousel">

             <div class="carousel-images">
                           <s:url var="url_bg1" value="/static/images/interior.jpg"/>
                           <s:url var="url_bg2" value="/static/images/modern.jpg"/>
                           <s:url var="url_bg3" value="/static/images/sofa-living.jpg"/>
                           <s:url var="url_bg4" value="/static/images/still-life.jpg"/>

                           <img src="${url_bg1}" alt="Interior Design"/>
                           <img src="${url_bg2}" alt="Modern Design"/>
                           <img src="${url_bg3}" alt="Sofa Living"/>
                           <img src="${url_bg4}" alt="Still Life"/>

                           <!-- Repeat images to create infinite loop -->
                           <img src="${url_bg1}" alt="Interior Design"/>
                           <img src="${url_bg2}" alt="Modern Design"/>
                           <img src="${url_bg3}" alt="Sofa Living"/>
                           <img src="${url_bg4}" alt="Still Life"/>
                        </div>
        </div>

        <div class="category-grid">
            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-couch">
                    </i> <h3>Furniture</h3>
                    <p>Modern and stylish furniture pieces for every room</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-lightbulb"></i>
                    <h3>Lighting</h3>
                    <p>Brighten your space with our designer lighting collection</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-paint-brush"></i>
                    <h3>Decor</h3>
                    <p>Add personality with our unique decorative pieces</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-leaf"></i>
                    <h3>Garden</h3>
                    <p>Transform your outdoor space into a paradise</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-bed"></i>
                    <h3>Bedding</h3>
                    <p>Luxury bedding for ultimate comfort</p>
                </div>
            </div>

            <div class="category-card">
                <div class="card-content">
                    <i class="fas fa-bath"></i>
                    <h3>Bath</h3>
                    <p>Create your personal spa experience</p>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <jsp:include page="include/footer.jsp"/>
    </footer>
</body>
</html>