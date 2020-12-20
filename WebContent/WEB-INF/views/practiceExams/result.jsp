<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h1>第&nbsp;<c:out value="${chapter.id}" />&nbsp;章&emsp;<c:out value="${chapter.title}" /></h1>

        <h2>模擬試験</h2>

        <p>テスト終了です。</p>

        <p class="bold">正解数：<c:out value="${correctlly_answered_questions_size}" />／<c:out value="${list_size}" /></p>

        <p>お疲れさまでした。</p>

        <p><a href="<c:url value='/index.html' />">トップページへ戻る</a></p>
    </c:param>
</c:import>
