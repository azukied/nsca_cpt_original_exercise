<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>NSCA-CPT オリジナル練習問題</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>

    <body>
        <header>
            <div class="header">
                <h1 class="title">NSCA-CPT 試験対策</h1>

                <nav>
                    <ul>
                        <li>
                            <a href="<c:url value='/index.html' />">トップページ</a>
                        </li>
                        <li>
                            <a href="<c:url value='/users/show' />">マイページ</a>
                        </li>
                        <li>
                            <a href="<c:url value='/users/new' />">新規ユーザ登録</a>
                        </li>
                        <c:if test="${sessionScope.login_user.admin_flag == 1}">
                            <li>
                                <a href="<c:url value='/users/index' />">登録ユーザ一覧</a>
                            </li>
                        </c:if>
                        <c:choose>
                            <c:when test="${sessionScope.login_user == null}">
                                <li>
                                    <a href="<c:url value='/login' />">ログイン</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="<c:url value='/logout' />">ログアウト</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </div>
        </header>

        <main>
            ${param.content}
        </main>

        <footer>
            <p>(c) 2020 Kenji Murata</p>
        </footer>
    </body>

</html>
