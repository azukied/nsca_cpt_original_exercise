<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <p><c:out value="${flush}" /></p>
        </c:if>

        <p>第&nbsp;<c:out value="${exercise.id}" />&nbsp;問</p>
        <p>問題<br /><c:out value="${exercise.question}" /></p>
        <p>選択肢A<br /><c:out value="${exercise.choice_a}" /></p>
        <p>選択肢B<br /><c:out value="${exercise.choice_b}" /></p>
        <p>選択肢C<br /><c:out value="${exercise.choice_c}" /></p>
        <p>選択肢D<br /><c:out value="${exercise.choice_d}" /></p>
        <p>正解：<c:out value="${exercise.correct_answer}" /></p>
        <p>解説<br /><c:out value="${exercise.explanation}" /></p>

        <p><a href="<c:url value='/exercises/edit?id=${exercise.id}' />">編集</a></p>

        <p><a href="<c:url value='/exercises/index?chapter_id=${exercise.chapter.id}' />">戻る</a></p>
    </c:param>
</c:import>
