<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <p><c:out value="${flush}" /></p>
        </c:if>

        <h1><c:out value="${user.nickname}" />さんのマイページ</h1>

        <p><a href="<c:url value='/users/edit?id=${user.id}' />">登録情報変更</a></p>

        <!--
        <h2>進捗状況</h2>

        <h2>復習問題一覧</h2>
         -->
    </c:param>
</c:import>
