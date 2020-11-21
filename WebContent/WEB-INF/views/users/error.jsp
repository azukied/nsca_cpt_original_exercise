<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${errors != null}">
    <div>
        入力内容にエラーがあります。
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br>
        </c:forEach>
    </div>
</c:if>
