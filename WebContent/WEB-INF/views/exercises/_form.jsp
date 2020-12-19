<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p>
    <label for="chapter_id">章番号</label>
    <input type="number" name="chapter_id" value="${exercise.chapter.id}" min="1" max="25" required id="chapter_id" />
</p>

<p>
    <label for="id">問題番号</label>
    <input type="number" name="id" value="${exercise.id}" min="1" required id="id" />
</p>

<p>
    <label for="question">問題</label>
    <textarea name="question" cols="100" rows="5" id="question">${exercise.question}</textarea>
</p>

<p>
    <label for="choice_a">選択肢A</label>
    <textarea name="choice_a" cols="100" rows="5" id="choice_a">${exercise.choice_a}</textarea>
</p>

<p>
    <label for="choice_b">選択肢B</label>
    <textarea name="choice_b" cols="100" rows="5" id="choice_b">${exercise.choice_b}</textarea>
</p>

<p>
    <label for="choice_c">選択肢C</label>
    <textarea name="choice_c" cols="100" rows="5" id="choice_c">${exercise.choice_c}</textarea>
</p>

<p>
    <label for="choice_d">選択肢D</label>
    <textarea name="choice_d" cols="100" rows="5" id="choice_d">${exercise.choice_d}</textarea>
</p>

<p>
    正解<br />
    <input type="radio" name="correct_answer" value="A" id="a" <c:if test="${exercise.correct_answer == 'A'}">checked</c:if> />
    <label for="a">A</label>
    <input type="radio" name="correct_answer" value="B" id="b" <c:if test="${exercise.correct_answer == 'B'}">checked</c:if> />
    <label for="b">B</label>
    <input type="radio" name="correct_answer" value="C" id="c" <c:if test="${exercise.correct_answer == 'C'}">checked</c:if> />
    <label for="c">C</label>
    <input type="radio" name="correct_answer" value="D" id="d" <c:if test="${exercise.correct_answer == 'D'}">checked</c:if> />
    <label for="d">D</label>
</p>

<p>
    <label for="explanation">解説</label>
    <textarea name="explanation" cols="100" rows="5" id="explanation">${exercise.explanation}</textarea>
</p>

<input type="hidden" name="_token" value="${_token}" />
