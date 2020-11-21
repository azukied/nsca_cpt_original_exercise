<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${errors != null}">
    <div>
        <p>入力内容にエラーがあります。</p>
        <c:forEach var="error" items="${errors}">
            <p>・<c:out value="${error}" /></p>
        </c:forEach>
    </div>
</c:if>
