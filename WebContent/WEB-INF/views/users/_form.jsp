<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<p>
    <label for="nickname">ニックネーム</label>
    <input type="text" name="nickname" value="${user.nickname}" id="nickname" />
</p>

<p>
    <label for="user_id">ID</label>
    <input type="text" name="user_id" value="${user.user_id}" id="user_id" />
</p>

<p>
    <label for="plain_pass">パスワード</label>
    <input type="password" name="plain_pass" id="plain_pass" />
</p>

<p>
    <label for="plain_conf_pass">確認用パスワード</label>
    <input type="password" name="plain_conf_pass" id="plain_conf_pass" />
</p>

<input type="hidden" name="_token" value="${_token}" />