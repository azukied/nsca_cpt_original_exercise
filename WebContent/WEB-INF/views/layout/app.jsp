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

    <header>
        <div>
            <h1>NSCA-CPT 試験対策</h1>
        </div>
        <div>
            <p>トップページ</p>
        </div>
        <div>
            <p>ユーザー登録</p>
        </div>
        <div>
            <p>ログイン</p>
        </div>
        <div>
            <p>ログアウト</p>
        </div>
    </header>

    <body>
        <div>
            ${param.content}
        </div>
    </body>

    <footer>
        <p>©2020 Kenji Murata</p>
    </footer>
</html>