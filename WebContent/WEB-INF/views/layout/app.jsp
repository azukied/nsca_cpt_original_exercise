<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>NSCA-CPT オリジナル練習問題</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>

    <body>
        <header>
            <h1 class="title">NSCA-CPT オリジナル練習問題</h1>

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
        </header>

        <main>
            ${param.content}
        </main>

        <footer>
            <small>&copy; 2020 Kenji Murata</small>
        </footer>

        <script type="text/javascript" src="<c:url value='/js/main.js' />"><!-- --></script>
    </body>

</html>
