<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h1>第&nbsp;<c:out value="${sessionScope.chapter.id}" />&nbsp;章&emsp;<c:out value="${sessionScope.chapter.title}" /></h1>

        <h2>模擬試験</h2>

        <c:choose>
            <c:when test="${correct_answer == sessionScope.exercise.correct_answer}">
                <p class="bold">正解○</p>
            </c:when>
            <c:otherwise>
                <p class="bold">不正解×</p>
            </c:otherwise>
        </c:choose>

        <p class="bold">第&nbsp;<c:out value="${sessionScope.exercise.id}" />&nbsp;問</p>
        <p><span class="bold">問題</span><br /><c:out value="${sessionScope.exercise.question}" /></p>
        <p><span class="bold">A</span><br /><c:out value="${sessionScope.exercise.choice_a}" /></p>
        <p><span class="bold">B</span><br /><c:out value="${sessionScope.exercise.choice_b}" /></p>
        <p><span class="bold">C</span><br /><c:out value="${sessionScope.exercise.choice_c}" /></p>
        <p><span class="bold">D</span><br /><c:out value="${sessionScope.exercise.choice_d}" /></p>
        <p class="bold">正解：<c:out value="${sessionScope.exercise.correct_answer}" /></p>
        <p><span class="bold">解説</span><br /><c:out value="${sessionScope.exercise.explanation}" /></p>

        <ul>
            <c:if test="${list_index > 0}">
                <li><a href="<c:url value='/practice_exams/question?list_index=${list_index - 1}' />">＜前へ</a></li>
            </c:if>
            <li><a href="<c:url value='/practice_exams/question?list_index=${list_index}' />">もう一度解く</a></li>
            <c:choose>
                <c:when test="${list_index < (list_size - 1)}">
                    <li><a href="<c:url value='/practice_exams/question?list_index=${list_index + 1}' />">次へ＞</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="<c:url value='/practice_exams/result' />">結果</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </c:param>
</c:import>
