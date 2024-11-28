<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login - Home Decor Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <s:url var="url_css" value="/static/css/style.css"/>
    <s:url var="url_bg" value="/static/images/bg.jpg"/>
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
            justify-content: center;
            font-size: 14px;
            padding-top: 60px; /* Height of the header */
            padding-bottom: 0px; /* Height of the footer */
        }
        .content-wrapper {
            flex: 1; /* Allows this section to take up remaining space, pushing footer down */
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
            padding: 0.2rem 0;
            text-align: center;
            color: var(--primary-color);
            font-family: 'Playfair Display', serif;
            font-size: 1.2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);

        }


        .menu {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 0.75rem 0.5rem;
            text-align: center;
            box-shadow: 0 2px  5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-bottom: 0.75rem;
            margin-top: 0rem;
            width: 100%;
            margin-left: auto;
            margin-right: auto;
        }

        .menu a {
            color: var(--gold-color);
            margin: 0 12px;
            text-decoration: none;
            font-weight: bold;
            font-size: 0.9rem;
        }

        .menu a:hover {
            color: #b59430;
        }

        .container {
            flex: 1;
            max-width: 460px;
            margin: 1.5rem auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 1rem;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(216, 164, 68, 0.5);
            border: 2px solid var(--gold-color);
        }

        h3 {
            font-family: 'Playfair Display', serif;
            color: var(--gold-color);
            font-size: 2.2rem;
            margin-bottom: 2rem;
            text-align: center;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            padding: 0.6rem 0.8rem;
            transition: all 0.3s ease;
            background: var(--light-bg);
            font-size: 0.9rem;
        }

        .form-control:focus {
            border-color: var(--gold-color);
            box-shadow: 0 0 0 0.2rem rgba(216, 164, 68, 0.25);
        }

        .btn-primary {
            background: var(--gold-color);
            background: linear-gradient(45deg, var(--gold-color), #b59430);
            border: none;
            padding: 0.75rem;
            font-weight: 500;
            border-radius: 6px;
            transition: background 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            font-size: 1.2rem;
            width: 40%;
            margin-left: 30%;
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #b59430, #D8A444);
            transform: translateY(-2px) scale(1.03);
        }

        .error {
            color: #e74c3c;
            text-align: center;
            padding: 0.75rem;
            background: rgba(231, 76, 60, 0.1);
            border-left: 4px solid #e74c3c;
            border-radius: 6px;
            margin-bottom: 0.75rem;
            font-size: 0.9rem;
        }

        .success {
            color: #27ae60;
            text-align: center;
            padding: 0.75rem;
            background: rgba(39, 174, 96, 0.1);
            border-left: 4px solid #27ae60;
            border-radius: 6px;
            margin-bottom: 0.75rem;
            font-size: 0.9rem;
        }

        footer {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 0.5rem 0;
            text-align: center;
            color: #000000;
            font-size: 0.6rem;
            box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }


        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--gold-color);
            opacity: 0.7;
            transition: opacity 0.3s ease;
        }

        .password-toggle:hover {
            opacity: 1;
        }

        .btn-link {
            color: var(--gold-color);
            transition: all 0.3s ease;
            text-align: center;
            display: block;
            text-decoration: none;
            font-weight: bold;
            font-size: 0.9rem;
            margin-top: 1rem;
        }

        .btn-link:hover {
            color: #b59430;
            text-decoration: underline;
        }

        .icon {
            color: var(--gold-color);
            margin-right: 0.5rem;
            transition: transform 0.3s ease;
            font-size: 1.2rem;
        }

        .icon:hover {
            transform: scale(1.1);
        }

        .is-invalid {
            border-color: #e74c3c !important;
        }

        @media (max-width: 768px) {
            .container {
                max-width: 90%;
                padding: 1.5rem;
            }

            header, .menu, footer {
                width: 90%;
            }

            h3 {
                font-size: 1.8rem;
            }

            .btn-primary {
                width: 60%;
                margin-left: 20%;
            }
        }

        @media (max-width: 480px) {
            body {
                font-size: 13px;
            }

            .container {
                padding: 1rem;
            }

            h3 {
                font-size: 1.5rem;
            }

            .btn-primary {
                width: 80%;
                margin-left: 10%;
            }
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


                <a href="<s:url value='/welcome'/>"><i class="fas fa-home"></i> Home</a> |
                <a href="<s:url value='/reg_form'/>"><i class="fas fa-user-plus"></i> Register</a> |
                <a href="<s:url value='/welcome'/>"><i class="fas fa-info-circle"></i> About</a> |
                <a href="<s:url value='/welcome'/>"><i class="fas fa-question-circle"></i> Help</a>
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

<div class="content-wrapper">
    <div class="container">
        <main>
            <h3>User Login</h3>

            <c:if test="${not empty err}">
                <p class="error">${err}</p>
            </c:if>
            <c:if test="${param.act eq 'lo'}">
                <p class="success">Logout Successfully! Thanks for using the Home Decor application.</p>
            </c:if>
            <c:if test="${param.act eq 'reg'}">
                <p class="success">User  Registered Successfully. Please login</p>
            </c:if>

            <f:form action="/OHDApplication/login" modelAttribute="command" class="form">
                <div class="form-group">
                    <label for="loginName">
                        <i class="fas fa-user icon"></i> Username
                    </label>
                    <f:input path="loginName" class="form-control" id="loginName" required="required"/>
                </div>

                <div class="form-group">
                    <label for="password">
                        <i class="fas fa-lock icon"></i> Password
                    </label>
                    <div style="position: relative;">
                        <f:password path="password" class="form-control" id="password" required="required"/>
                        <span class="password-toggle" onclick="togglePassword()">
                            <i class="fas fa-eye icon"></i>
                        </span>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>

                <a href="<s:url value='/reg_form'/>" class="btn-link">
                    <i class="fas fa-user-plus"></i> Create New Account
                </a>
            </f:form>
        </main>
    </div>
</div>
    <footer>
        <jsp:include page="include/footer.jsp"/>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Enhanced form validation and UI interactions
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.querySelector('label')?.style.color = '#d4af37';
            });

            input.addEventListener('blur', function() {
                this.parentElement.querySelector('label')?.style.color = '#2c3e50';
            });
        });

        // Password visibility toggle
 function togglePassword() {
            const passwordInput = document.getElementById('password');
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
        }

        // Form validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const username = document.getElementById('loginName');
            const password = document.getElementById('password');
            let isValid = true;

            if (username.value.trim() === '') {
                e.preventDefault();
                username.classList.add('is-invalid');
                isValid = false;
            } else {
                username.classList.remove('is-invalid');
            }

            if (password.value.trim() === '') {
                e.preventDefault();
                password.classList.add('is-invalid');
                isValid = false;
            } else {
                password.classList.remove('is-invalid');
            }

            if (!isValid) {
                const existingError = document.querySelector('.error');
                if (existingError) {
                    existingError.remove();
                }

                const errorMsg = document.createElement('p');
                errorMsg.className = 'error';
                errorMsg.textContent = 'Please fill in all required fields.';
                this.insertBefore(errorMsg, this.firstChild);
                setTimeout(() => errorMsg.remove(), 3000);
            }
        });
    </script>
</body>
</html>