<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div>
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <h1>○○さんのマイページ</h1>

        <p><a href="<c:url value='/users/edit' />">登録情報変更</a></p>

        <h2>進捗状況</h2>

        <h2>あとで見直す問題一覧</h2>
    </c:param>
</c:import>