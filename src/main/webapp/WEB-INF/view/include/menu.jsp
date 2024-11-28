<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>

<s:url var="url_logout" value="/logout"/>
<div class="navbar" style="background: rgba(255, 255, 255, 0.95); padding: 1rem; text-align: right; backdrop-filter: blur(10px);">
    <c:if test="${sessionScope.userId == null}">
        <%-- Guest Menu --%>
        <s:url var="url_reg_form" value="/reg_form"/>
        <s:url var="url_index" value="/index"/>
        <a href="${url_index}"><i class="fas fa-home"></i> Home</a> |
        <a href="${url_index}"><i class="fas fa-sign-in-alt"></i> Login</a> |
        <a href="${url_reg_form}"><i class="fas fa-user-plus"></i> Register</a> |
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
        <s:url var="url_uhome" value="/user/dashboard"/>
        <s:url var="url_product_list" value="/users/product/list"/>
        <a href="${url_uhome}"><i class="fas fa-home"></i> Home</a> |
        <a href="${url_product_list}"><i class="fas fa-list"></i> Product List</a> |
        <a href="${url_logout}"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </c:if>
    <c:if test="${sessionScope.userId != null && sessionScope.role == 3}">
        <%-- Vendor Menu --%>
        <a href="<s:url value='/vendor/dashboard'/>"><i class="fas fa-home"></i> Home</a> |
        <s:url var="url_product_list" value="/product/list"/>
        <a href="${url_product_list}"><i class="fas fa-list"></i> Product List</a> |
        <a href="${url_logout}"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </c:if>
</div>