<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - Home Decor Application</title>
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
            font-family: 'Poppins', ui-sans-serif;
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 14px;
            padding-top: 60px;
            padding-bottom: 0px;
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
        .container {
            flex: 1;
            max-width: 460px;
            margin: 1.5rem auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 2rem;
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

        .form-control,
        f\:input,
        f\:password,
        f\:textarea,
        f\:select {
            width: 80%;
            height : 20%;
            border: 2px solid #e0e0e0;
            border-radius: 6px;
            padding: 0.6rem 0.8rem;
            transition: all 0.3s ease;
            background: var(--light-bg);
            font-size: 0.9rem;
            font-family: 'Poppins', sans-serif;
        }

        .form-control:focus,
        f\:input:focus,
        f\:password:focus,
        f\:textarea:focus,
        f\:select:focus {
            border-color: var(--gold-color);
            box-shadow: 0 0 0 0.2rem rgba(216, 164, 68, 0.25);
            outline: none;
        }

        f\:textarea {
            min-height: 100px;
            resize: vertical;
        }

        .btn-primary {
            background: var(--gold-color);
            background: linear-gradient(45deg, var(--gold-color), #b59430);
            border: none;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            border-radius: 6px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: white;
            font-size: 1.1rem;
            width: auto;
            min-width: 150px;
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #b59430, #D8A444);
            transform: translateY(-2px) scale(1.03);
        }

        #id_check_avail {
            background: var(--gold-color);
            color: white;
            border: none;

            border-radius: 4px;
            cursor: pointer;
            font-size: 0.85rem;
            margin-left: 10px;
            transition: all 0.3s ease;
        }

        #id_check_avail:hover {
            background: #b59430;
            transform: translateY(-1px);
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

      .error {
          color: #069d00;
          text-align: center;
          padding: 0.75rem;
          background: rgb(255 255 255 / 10%);
          border-left: 4px solid #ffffff;
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

        .icon {
            color: var(--gold-color);
            margin-right: 0.5rem;
            transition: transform 0.3s ease;
            font-size: 1.2rem;
        }

        @media (max-width: 768px) {
            .container {
                max-width: 90%;
                padding: 1.5rem;
            }

            h3 {
                font-size: 1.8rem;
            }

            .btn-primary {
                width: 100%;
                margin: 0.5rem 0;
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
                <a href="<s:url value='/index'/>"><i class="fas fa-sign-in-alt"></i> Login</a> |
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
            <h3>User Registration</h3>

            <c:if test="${err != null}">
                <p class="error">${err}</p>
            </c:if>

            <s:url var="url_reg" value="/register"/>
            <f:form action="${url_reg}" modelAttribute="command">
                <div class="form-group">
                    <label for="name">
                        <i class="fas fa-user icon"></i> Name
                    </label>
                    <f:input path="user.name" id="name" class="form-control" required="required"/>
                </div>

                <div class="form-group">
                    <label for="phone">
                        <i class="fas fa-phone icon"></i> Phone
                    </label>
                    <f:input path="user.phone" id="phone" class="form-control" required="required"/>
                </div>

                <div class="form-group">
                    <label for="email">
                        <i class="fas fa-envelope icon"></i> Email
                    </label>
                    <f:input path="user.email" id="email" class="form-control" required="required"/>
                </div>

                <div class="form-group">
                    <label for="address">
                        <i class="fas fa-home icon"></i> Address
                    </label>
                    <f:textarea path="user.address" id="address" class="form-control" required="required"/>
                </div>

                <div class="form-group">
                    <label for="role">
                        <i class="fas fa-user-tag icon"></i> Role
                    </label>
                    <f:select path="user.role" id="role" class="form-control">
                        <f:option value="" label="Select a role"/>
                        <f:option value="2">Buyer</f:option>
                        <f:option value="3">Vendor</f:option>
                    </f:select>
                </div>

                <div class="form-group">
                    <label for="id_username">
                        <i class="fas fa-user-circle icon"></i> Username
                    </label>
                    <div class="d-flex">
                        <f:input id="id_username" path="user.loginName" class="form-control" required="required"/>
                        <button type="button" id="id_check_avail" class="ml-2">
                            <i class="fas fa-check-circle"></i> Check Availability
                        </button>
                    </div>
                    <div id="id_res_div" class="error mt-2"></div>
                </div>

                <div class="form-group">
                    <label for="password">
                        <i class="fas fa-lock icon"></i> Password
                    </label>
                    <f:password path="user.password" id="password" class="form-control" required="required"/>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-user-plus"></i> Register Here                    </button>
                </div>
                <a href="<s:url value='/index'/>" class="btn-link">
                                    <i class="fas fa-user-plus"></i> Already have an account? Login
                                </a>
            </f:form>
        </main>
    </div>
    </div>
        <br><br>
    <footer>
        <jsp:include page="include/footer.jsp"/>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
            $(document).ready(function (){
                // Check availability button click event
                $("#id_check_avail").click(function(){
                    $.ajax({
                        url : 'check_avail',
                        data : { username: $("#id_username").val() },
                        success : function(data){
                            $("#id_res_div").html(data);
                        }
                    });
                });

                // Live validation
                function validateField(field, validationFunc) {
                    const value = $(field).val();
                    const errorDiv = $(field).next('.error');
                    errorDiv.remove(); // Clear previous error message

                    const errorMessage = validationFunc(value);
                    if (errorMessage) {
                        $(field).after('<div class="error" style="color: red; margin-top: 5px;">' + errorMessage + '</div>');
                        return false;
                    }
                    return true;
                }

                // Validation functions
                function validateName(name) {
                    if (name.trim() === "") {
                        return "Name is required.";
                    }
                    if (!/^[A-Za-z\s]+$/.test(name)) {
                        return "Name can only contain letters and spaces.";
                    }
                    return null;
                }

                function validatePhone(phone) {
                    if (phone.trim() === "") {
                        return "Phone number is required.";
                    }
                    if (!/^\d{10}$/.test(phone)) {
                        return "Phone number must be exactly 10 digits.";
                    }
                    return null;
                }

                function validateEmail(email) {
                    if (email.trim() === "") {
                        return "Email is required.";
                    }
                    const validDomainPattern = /^[a-zA-Z0-9._%+-]+@(yash\.com|gmail\.com)$/;
                    if (!validDomainPattern.test(email)) {
                        return "Email must be from either yash.com or gmail.com domain.";
                    }
                    return null;
                }

                function validateUsername(username) {
                    if (username.trim() === "") {
                        return "Username is required.";
                    }
                    return null;
                }

                function validatePassword(password) {
                    if (password.trim() === "") {
                        return "Password is required.";
                    }

                    const minLength = 6;
                    const hasUpperCase = /[A-Z]/.test(password);
                    const hasLowerCase = /[a-z]/.test(password);
                    const hasNumbers = /\d/.test(password);
                    const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

                    let errors = [];

                    if (password.length < minLength) {
                        errors.push("at least 6 characters");
                    }
                    if (!hasUpperCase) {
                        errors.push("one uppercase letter");
                    }
                    if (!hasLowerCase) {
                        errors.push("one lowercase letter");
                    }
                    if (!hasNumbers) {
                        errors.push("one number");
                    }
                    if (!hasSpecialChar) {
                        errors.push("one special character");
                    }

                    if (errors.length > 0) {
                        return "Password must contain " + errors.join(", ");
                    }

                    return null;
                }

                function validateAddress(address) {
                    if (address.trim() === "") {
                        return "Address is required.";
                    }
                    return null;
                }

                function validateRole(role) {
                    if (!role || role.trim() === "") {
                        return "Please select a role (Buyer or Seller).";
                    }
                    return null;
                }

                // Add password strength indicator
                function updatePasswordStrength(password) {
                    const strengthIndicator = $("#password-strength");
                    if (!strengthIndicator.length) {
                        $("input[name='user.password']").after('<div id="password-strength" style="margin-top: 5px;"></div>');
                    }




                }

                // Prevent non-numeric input in phone field
                $("input[name='user.phone']").on('keypress', function(e) {
                    if (e.which < 48 || e.which > 57) {
                        e.preventDefault();
                    }
                });

                // Prevent numeric input in name field
                $("input[name='user.name']").on('keypress', function(e) {
                    var char = String.fromCharCode(e.which);
                    if (!/^[A-Za-z\s]$/.test(char)) {
                        e.preventDefault();
                    }
                });

                // Attach keyup event for live validation
                $("input[name='user.name']").on('keyup', function() {
                    validateField(this, validateName);
                });

                $("input[name='user.phone']").on('keyup', function() {
                    validateField(this, validatePhone);
                });

                $("input[name='user.email']").on('keyup', function() {
                    validateField(this, validateEmail);
                });

                $("#id_username").on('keyup', function() {
                    validateField(this, validateUsername);
                });

                $("input[name='user.password']").on('keyup', function() {
                    validateField(this, validatePassword);

                });

                $("textarea[name='user.address']").on('keyup', function() {
                    validateField(this, validateAddress);
                });

                $("select[name='user.role']").on('change', function() {
                    validateField(this, validateRole);
                });

                // Add requirement notes under password field

                // Form submission validation
                $("form").submit(function(event) {
                    let isValid = true;

                    // Validate all fields
                    isValid &= validateField($("input[name='user.name']"), validateName);
                    isValid &= validateField($("input[name='user.phone']"), validatePhone);
                    isValid &= validateField($("input[name='user.email']"), validateEmail);
                    isValid &= validateField($("#id_username"), validateUsername);
                    isValid &= validateField($("input[name='user.password']"), validatePassword);
                    isValid &= validateField($("textarea[name='user.address']"), validateAddress);
                    isValid &= validateField($("select[name='user.role']"), validateRole);

                    if (!isValid) {
                        event.preventDefault(); // Prevent form submission
                    }
                });
            });
           </script>
</body>
</html>