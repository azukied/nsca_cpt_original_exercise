<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <p class="flush"><c:out value="${flush}" /></p>
        </c:if>

        <h1>登録ユーザ一覧</h1>

        <table>
            <thead>
                <tr>
                    <th>ニックネーム</th>
                    <th>ユーザID</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><c:out value="${user.nickname}" /></td>
                        <td><c:out value="${user.user_id}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- ページネーション -->
        <div>
            <p>登録ユーザ数：全 ${users_count} 件</p>
            <c:forEach var="i" begin="1" end="${((users_count - 1) / 100) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>

                    <c:otherwise>
                        <a href="<c:url value='/users/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p>
            <a href="<c:url value='/users/new' />">新規ユーザ登録</a>
        </p>
    </c:param>
</c:import>
