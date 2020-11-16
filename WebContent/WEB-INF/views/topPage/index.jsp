<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h1>NSCA-CPT オリジナル練習問題</h1>

        <p>
            <c:forEach var="chapterNumber" items="${chapterNumbers}">
               <span>第<c:out value="${chapterNumber}" />章</span>
            </c:forEach>
            <c:forEach var="chapterTitle" items="${chapterTitles}">
               <span><c:out value="${chapterTitle}" /></span>
            </c:forEach>
        </p>
    </c:param>
</c:import>