<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <p><c:out value="${flush}" /></p>
        </c:if>

        <h1>練習問題一覧</h1>

        <ul>
            <c:forEach var="exercise" items="${exercises}">
                <c:if test="${exercise.chapter.id == chapter_id}">
                    <li>
                        <a href="<c:url value='/exercises/show?id=${exercise.id}' />">第&nbsp;<c:out value="${exercise.id}" />&nbsp;問&emsp;<c:out value="${exercise.question}" /></a>
                    </li>
                </c:if>
            </c:forEach>
        </ul>

        <!-- ページネーション -->
        <div>
            <p>登録問題数：全 ${users_count} 件</p>
            <c:forEach var="i" begin="1" end="${((exercises_count - 1) / 50) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>

                    <c:otherwise>
                        <a href="<c:url value='/exercises/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p>
            <a href="<c:url value='/exercises/new' />">新規問題登録</a>
        </p>
    </c:param>
</c:import>
