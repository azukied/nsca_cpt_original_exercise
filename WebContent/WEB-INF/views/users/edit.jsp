<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/app.jsp">
    <c:param name="content">

        <c:choose>
            <c:when test="${user != null}">
                <h1><c:out value="${user.nickname}" />さんのユーザ情報編集ページ</h1>

                <p>（パスワードは変更する場合のみ入力してください。）</p>

                <c:import url="error.jsp" />

                <form method="POST" action="<c:url value='/users/update' />">
                    <c:import url="_form.jsp" />

                    <button type="submit">変更</button>
                </form>

                <p><a href="#" onclick="confirmDestroy();">このユーザ情報を削除する</a></p>

                <form method="POST" action="<c:url value='/users/destroy' />">
                    <input type="hidden" name="_token" value="${_token}" />
                </form>

                <script>
                    function confirmDestroy() {
                        if (confirm("本当に削除してよろしいですか？")) {
                            document.forms[1].submit();
                        }
                    }
                </script>
            </c:when>

            <c:otherwise>
                <p>お探しのデータは見つかりませんでした。</p>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/users/index' />">戻る</a></p>
    </c:param>
</c:import>
