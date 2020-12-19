<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h1>新規問題登録</h1>

        <c:import url="error.jsp" />

        <form method="POST" action="<c:url value='/exercises/create' />">
            <c:import url="_form.jsp" />

            <button type="submit">登録</button>
        </form>

        <p><a href="<c:url value='/exercises/index?chapter_id=${chapter_id}' />">戻る</a></p>
    </c:param>
</c:import>
