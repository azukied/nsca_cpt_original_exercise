<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h1>問題編集</h1>

        <c:import url="error.jsp" />

        <form method="POST" action="<c:url value='/exercises/update' />">
            <c:import url="_form.jsp" />

            <button type="submit">編集</button>
        </form>
    </c:param>
</c:import>
