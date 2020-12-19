<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <!-- リクエストスコープにhasErrorという変数がtrueでセットされていれば、エラーメッセージを表示 -->
        <c:if test="${hasError}">
            <p class="error">ユーザID、パスワードまたは確認用パスワードが間違っています。</p>
        </c:if>

        <c:if test="${flush != null}">
            <p><c:out value="${flush}" /></p>
        </c:if>

        <h1>ログイン</h1>

        <form method="POST" action="<c:url value='/login' />">
            <p>
                <label for="user_id">ID</label>
                <input type="text" name="user_id" value="${user_id}" required id="user_id" />
            </p>

            <p>
                <label for="plain_pass">パスワード</label>
                <input type="password" name="plain_pass" required id="plain_pass" />
            </p>

            <p>
                <label for="plain_conf_pass">確認用パスワード</label>
                <input type="password" name="plain_conf_pass" required id="plain_conf_pass" />
                （パスワードと同じものを入力してください。）
            </p>

            <input type="hidden" name="_token" value="${_token}" />

            <button type="submit">ログイン</button>
        </form>
    </c:param>
</c:import>