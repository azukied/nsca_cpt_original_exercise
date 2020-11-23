<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h1>新規ユーザ登録</h1>

        <c:import url="error.jsp" />

        <form method="POST" action="<c:url value='/users/create' />">
            <c:import url="_form.jsp" />

            <input type="hidden" name="admin_flag" value="0" />

            <button type="submit">登録</button>
        </form>
    </c:param>
</c:import>
