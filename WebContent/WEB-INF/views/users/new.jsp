<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h1>新規ユーザー登録</h1>
        
        <form method="POST" action="<c:url value='/users/create' />">
            <p>
                <label for="nickname">ニックネーム</label>
                <input type="text" name="nickname" value="${user.nickname}" id="nickname" />
            </p>

            <input type="hidden" name="admin_flag" value="0" />
            
            <c:import url="_form.jsp" />
        </form>
    </c:param>
</c:import>
