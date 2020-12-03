<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <p><c:out value="${flush}" /></p>
        </c:if>

        <h1>NSCA-CPT オリジナル練習問題</h1>

        <c:forEach var="part" items="${parts}">
            <h2>PART&nbsp;<c:out value="${part.id}" />&emsp;<c:out value="${part.title}" /></h2>

            <c:forEach var="chapter" items="${chapters}">
                <c:if test="${part.id == chapter.part.id}">
                    <ul>
                        <li><a href="<c:url value='/exercises/index?chapter_id=${chapter.id}' />">第&nbsp;<c:out value="${chapter.id}" />&nbsp;章&emsp;<c:out value="${chapter.title}" /></a></li>
                    </ul>
                </c:if>
            </c:forEach>
        </c:forEach>
    </c:param>
</c:import>
