package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;
import utils.DBUtil;

public class UserValidator {

    // バリデーションを実行
    public static List<String> validate(User u, String conf_pass, Boolean user_id_duplicate_check_flag, Boolean password_check_flag) {
        List<String> errors = new ArrayList<String>();

        String user_id_error = _validateUserId(u.getUser_id(), user_id_duplicate_check_flag);
        if (!user_id_error.equals("")) {
            errors.add(user_id_error);
        }

        String nickname_error = _validateNickname(u.getNickname());
        if (!nickname_error.equals("")) {
            errors.add(nickname_error);
        }

        String password_error = _validatePassword(u.getPassword(), conf_pass, password_check_flag);
        if (!password_error.equals("")) {
            errors.add(password_error);
        }

        return errors;
    }

    // ユーザーID
    private static String _validateUserId(String user_id, Boolean user_id_duplicate_check_flag) {
        // 必須入力チェック
        if (user_id == null || user_id.equals("")) {
            return "ユーザーIDを入力してください。";
        }

        // すでに登録されているユーザーIDとの重複チェック
        if (user_id_duplicate_check_flag) {
            EntityManager em = DBUtil.createEntityManager();
            long users_count = (long)em.createNamedQuery("checkRegisteredUserId", Long.class)
                                         .setParameter("user_id", user_id)
                                         .getSingleResult();
            em.close();
            if (users_count > 0) {
                return "入力されたユーザーIDはすでに存在しています。";
            }
        }

        return "";
    }

    // ニックネームの必須入力チェック
    private static String _validateNickname(String nickname) {
        if (nickname == null || nickname.equals("")) {
            return "ニックネームを入力してください。";
        }

        return "";
    }

    // パスワードの必須入力チェック
    private static String _validatePassword(String password, String conf_pass, Boolean password_check_flag) {
        // パスワードを変更する場合のみ実行
        if (password_check_flag && (password == null || password.equals(""))) {
            return "パスワードを入力してください。";
        }
        // パスワードと確認用パスワードの一致を確認
        else if (password_check_flag && !password.equals(conf_pass)) {
            return "パスワードが一致しません。";
        }

        return "";
    }

}
