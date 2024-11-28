<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <s:url var="url_css" value="/static/css/style.css"/>
    <link href="${url_css}" rel="stylesheet" type="text/css"/>
    <s:url var="url_jqlib" value="/static/js/jquery-3.2.1.min.js" />
    <script src="${url_jqlib}"></script>
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
            max-width: 900px;
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
            max-height: 400px;
            overflow-y: auto;
        }

        select.form-control {
            padding: 0.5rem;
            border: 1px solid var(--gold-color);
            border-radius: 4px;
            background-color: white;
            width: auto;
            display: inline-block;
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
    <script>
        function changeStatus(uid, lstatus){
            $.ajax({
                url: 'change_status',
                data: { userId: uid, loginStatus: lstatus },
                success: function (data) {
                    alert(data);
                }
            });
        }
    </script>
</head>
<body>
       <header>
                       <jsp:include page="/WEB-INF/view/include/header.jsp" />
           </header>

    <div class="container mt-5">
        <h1 class="mb-4">User List</h1>
        <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn btn-secondary back-button">Back to Admin Dashboard</a>

        <div class="scrollable-table">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>SR</th>
                        <th>USER ID</th>
                        <th>NAME</th>
                        <th>PHONE</th>
                        <th>EMAIL</th>
                        <th>ADDRESS</th>
                        <th>USERNAME</th>
                        <th>STATUS</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${userList}" varStatus="st">
                        <tr>
                            <td>${st.count}</td>
                            <td>${u.userId}</td>
                            <td>${u.name}</td>
                            <td>${u.phone}</td>
                            <td>${u.email}</td>
                            <td>${u.address}</td>
                            <td>${u.loginName}</td>
                            <td>
                                <select id="id_${u.userId}" class="form-control"
                                        onchange="changeStatus(${u.userId}, $(this).val())">
                                    <option value="1">Active</option>
                                    <option value="2">Block</option>
                                </select>
                                <script>
                                    $('#id_${u.userId}').val(${u.loginStatus});
                                </script>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

     <footer>
            <jsp:include page="include/footer.jsp"/>
        </footer>
</body>
</html>