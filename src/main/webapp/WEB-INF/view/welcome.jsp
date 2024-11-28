<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Decor Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

        .container {
            background-color: transparent;
        }

        .container-section {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 8px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .section-title {
            color: var(--gold-color);
            margin-bottom: 1.5rem;
            text-align: center;
            font-family: 'Playfair Display', serif;
        }

        .section-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }

        .section-card {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 8px;
            padding: 1.5rem;
            text-align: center;
            transition: transform 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .section-card:hover {
            transform: translateY(-10px);
        }

        .section-card i {
            color: var(--gold-color);
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .section-card h3 {
            color: var(--primary-color);
            margin-bottom: 0.75rem;
        }

        .categories {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            margin-bottom: 2rem;
        }

        .category-card {
            position: relative;
            width: 250px;
            height: 300px;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transform: scale(1);
            transition: all 0.3s ease;
        }

        .category-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
            border-radius: 15px;
        }

        .category-card:hover img {
            transform: scale(1.1);
        }

        .category-info {
            position: absolute;
            bottom: 20px;
            left: 20px;
            right: 20px;
            text-align: center;
            color: white;
            z-index: 1;
        }

        .category-info h3 {
            font-size: 22px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: rgba(255, 255, 255, 0.9);
        }

        .contact-form button {
            background-color: var(--gold-color);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .contact-form button:hover {
            background-color: #b59430;
        }

        .cta-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 20px;
            animation: fadeIn 1s ease-in;
        }

        .cta-buttons a {
            text-decoration: none;
            padding: 15px 30px;
            border-radius: 8px;
            font-size: 18px;
            font-weight: bold;
            transition: all 0.3s ease;
            color: white;
        }

        .shop-now {
              background: linear-gradient(135deg, #cd6b19, #dd7a2a);
        }

        .shop-now:hover {
            background: linear-gradient(135deg, #cd6b19, #dd7a2a);
        }

        .sell-with-us {
            background: #4a3219;
        }

        .sell-with-us:hover {
            background: #333;
        }

        footer {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 0.2rem 0;
            text-align: center;
            color: #000000;
            font-size: 0.6rem;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        @media (max-width: 768px) {
            .section-content, .categories {
                grid-template-columns: 1fr;
            }

            header, footer {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <header>
        <jsp:include page="include/header.jsp"/>
    </header>
    <br>
    <div class="container">
        <!-- Header Section -->
        <div id="header" class="container-section text-center mb-4">
            <h1>Transform Your Home with Style</h1>
            <p>Browse our wide range of elegant home decor products to suit every taste.</p>
            <div class="cta-buttons">
                <a href="<c:url value='/reg_form'/>" class="shop-now">Shop Now</a>
                <a href="<c:url value='/reg_form'/>" class="sell-with-us">Sell with Us</a>
            </div>
        </div>

        <!-- Categories Section -->
        <div id="categories" class="container-section">
            <h2 class="section-title">Our Categories</h2>
            <div class="categories">
                <div class="category-card">
                    <s:url var="url_bg1" value="/static/images/livingroom.jpg"/>
                    <img src="${url_bg1}" alt="Living Room"/>
                    <div class="category-info">
                        <h3>Living Room</h3>
                    </div>
                </div>
                <div class="category-card">
                    <s:url var="url_bg2" value="/static/images/bedroom.jpg"/>
                    <img src="${url_bg2}" alt="Bedroom">
                    <div class="category-info">
                        <h3>Bedroom</h3>
                    </div>
                </div>
                <div class="category-card">
                    <s:url var="url_bg3" value="/static/images/office.jpg"/>
                    <img src="${url_bg3}" alt="Office">
                    <div class="category-info">
                        <h3>Office</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- About Us Section -->
        <div id="about" class="container-section">
            <h2 class="section-title">About Us</h2>
            <div class="section-content">
                <div class="section-card">
                    <i class="fas fa-home"></i>
                    <h3>Our Mission</h3>
                    <p>Transform spaces with elegant and affordable home decor solutions that inspire and delight.</p>
                </div>
                <div class="section-card">
                    <i class="fas fa-users"></i>
                    <h3>Our Team</h3>
                    <p>A passionate group of design enthusiasts dedicated to bringing beauty to every home.</p>
                </div>
                <div class="section-card">
                    <i class="fas fa-heart"></i>
                    <h3>Our Commitment</h3>
                    <p>Providing high-quality, stylish home decor items that make your living spaces truly special.</p>
                </div>
            </div>

            <!-- Detailed About Section -->
            <div class="mt-4">
                <h3 class="text-center mb-3">Budget-Friendly Home Decor Tips</h3>
                <div class="section-content">
                    <div class="section-card">
                        <h4>Define Your Style</h4>
                        <p>Determine the style and theme you want for your home décor to narrow down your search.</p>
                    </div>
                    <div class="section-card">
                        <h4>Set a Budget</h4>
                        <p>Decide on a budget to avoid overspending and focus on items within your price range.</p>
                    </div>
                    <div class="section-card">
                        <h4>Measure Your Space</h4>
                        <p>Take accurate measurements to determine appropriate sizes and dimensions.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Help Section -->
        <div id="help" class="container-section">
            <h2 class="section-title">Why Buy Home Decor Online?</h2>
            <div class="section-content">
                <div class="section-card">
                    <i class="fas fa-shopping-cart"></i>
                    <h3>Convenience</h3>
                    <p>Browse and purchase items from the comfort of your home, saving time and effort.</p>
                </div>
                <div class="section-card">
                    <i class="fas fa-palette"></i>
                    <h3>Vast Selection</h3>
                    <p>Explore a wide range of styles, colors, and designs from various sellers and brands.</p>
                </div>
                <div class="section-card">
                    <i class="fas fa-tags"></i>
                    <h3>Great Deals</h3>
                    <p>Access exclusive promotions, discounts, and sales events not available in physical stores.</p>
                </div>
            </div>
        </div>

        <!-- Contact Us Section -->
        <div id="contact" class="container-section">
            <h2 class="section-title">Contact Us</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="section-card mb-4">
                        <i class="fas fa-map-marker-alt"></i>
                        <h3>Our Location</h3>
                        <p>YASH IT PARK, Plot No. 1, Scheme Number 166 Super Corridor Road,
                        Indore, Madhya Pradesh, 452005</p>
                    </div>
                    <div class="section-card">
                        <i class="fas fa-envelope"></i>
                        <h3>Contact Information</h3>
                        <p>Phone: 18001035700</p>
                        <p>Email: info@yash.com</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <form class="contact-form">
                        <input type="text" name="fullName" placeholder="Full Name" required>
                        <input type="email" name="email" placeholder="Email" required>
                        <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
                        <button type="submit" class="btn btn-block">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <jsp:include page="include/footer.jsp"/>
    </footer>
</body>
</html>