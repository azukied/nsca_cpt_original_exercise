<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h1>第&nbsp;<c:out value="${sessionScope.chapter.id}" />&nbsp;章&emsp;<c:out value="${sessionScope.chapter.title}" /></h1>

        <h2>模擬試験</h2>

        <p>第&nbsp;<c:out value="${sessionScope.exercise.id}" />&nbsp;問</p>
        <p>問題<br /><c:out value="${sessionScope.exercise.question}" /></p>

        <form method="POST" action="<c:url value='/practice_exams/answer?list_index=${list_index}' />">
            <p>
                <input type="radio" name="correct_answer" value="a" id="a" />
                <label for="a">A：<c:out value="${sessionScope.exercise.choice_a}" /></label>
            </p>
            <p>
                <input type="radio" name="correct_answer" value="b" id="b" />
                <label for="b">B：<c:out value="${sessionScope.exercise.choice_b}" /></label>
            </p>
            <p>
                <input type="radio" name="correct_answer" value="c" id="c" />
                <label for="c">C：<c:out value="${sessionScope.exercise.choice_c}" /></label>
            </p>
            <p>
                <input type="radio" name="correct_answer" value="d" id="d" />
                <label for="d">D：<c:out value="${sessionScope.exercise.choice_d}" /></label>
            </p>

            <button type="submit">解答</button>
        </form>
    </c:param>
</c:import>
