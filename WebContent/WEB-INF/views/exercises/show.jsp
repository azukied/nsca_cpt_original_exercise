<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <p><c:out value="${flush}" /></p>
        </c:if>

        <p><span class="bold">第&nbsp;<c:out value="${exercise.id}" />&nbsp;問</span></p>
        <p><span class="bold">問題</span><br /><c:out value="${exercise.question}" /></p>
        <p><span class="bold">A</span><br /><c:out value="${exercise.choice_a}" /></p>
        <p><span class="bold">B</span><br /><c:out value="${exercise.choice_b}" /></p>
        <p><span class="bold">C</span><br /><c:out value="${exercise.choice_c}" /></p>
        <p><span class="bold">D</span><br /><c:out value="${exercise.choice_d}" /></p>
        <p><span class="bold">正解：<c:out value="${exercise.correct_answer}" /></span></p>
        <p><span class="bold">解説</span><br /><c:out value="${exercise.explanation}" /></p>

        <c:if test="${sessionScope.login_user.admin_flag == 1}">
            <p><a href="<c:url value='/exercises/edit?exercise_id=${exercise.id}' />">編集</a></p>
        </c:if>

        <p><a href="<c:url value='/exercises/index?chapter_id=${exercise.chapter.id}' />">戻る</a></p>
    </c:param>
</c:import>
