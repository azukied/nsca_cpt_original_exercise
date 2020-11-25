package controllers.users;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import models.validators.UserValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class UsersUpdateServlet
 */
@WebServlet("/users/update")
public class UsersUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        // CSRF対策のチェックを実行
        if (_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            // セッションスコープからユーザのID番号（PK）を取得して、該当のIDのユーザデータ1件のみをDBから取得
            User u = em.find(User.class, (Integer)(request.getSession().getAttribute("useridpk")));

            // 現在と異なるユーザIDが入力されていたら、すでに登録されている他ユーザIDとの重複チェックを行う指定をする。
            Boolean user_id_duplicate_check_flag = true;
            if (u.getUser_id().equals(request.getParameter("user_id"))) {
                user_id_duplicate_check_flag = false;
            } else {
                u.setUser_id(request.getParameter("user_id"));
            }

            // パスワード欄に入力があったら、パスワードの入力値チェックを行う指定をする。
            Boolean password_check_flag = true;
            String plain_pass = request.getParameter("plain_pass");
            String plain_conf_pass = request.getParameter("plain_conf_pass");
            String conf_pass = null;
            if ((plain_pass == null || plain_pass.equals("")) && (plain_conf_pass == null || plain_conf_pass.equals(""))) {
                password_check_flag = false;
            } else {
                u.setPassword(
                    EncryptUtil.getPasswordEncrypt(
                        plain_pass,
                        (String)this.getServletContext().getAttribute("pepper")
                    )
                );

                // 確認用パスワードもハッシュ化
                // （ハッシュ化したパスワードとハッシュ化した確認用パスワードの一致をあとで確認）
                conf_pass = EncryptUtil.getPasswordEncrypt(
                                request.getParameter("plain_conf_pass"),
                                (String)this.getServletContext().getAttribute("pepper")
                            );
            }

            // 以下、u.set～で、フォームから受け取ったデータで各フィールドを上書き
            u.setNickname(request.getParameter("nickname"));

            // バリデーションを実行
            List<String> errors = UserValidator.validate(u, conf_pass, user_id_duplicate_check_flag, password_check_flag);
            // エラーがあれば編集ページに戻る。
            if (errors.size() > 0) {
                em.close();

                // フォームに初期値を設定した状態でエラーメッセージを送る。
                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("user", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/edit.jsp");
                rd.forward(request, response);
            // エラーがなければデータを変更してマイページへ移動
            } else {
                em.getTransaction().begin();    // DBから取得したユーザデータを変更してコミットすれば反映されるので、em.persist(e);は不要
                em.getTransaction().commit();    // ユーザデータの変更を確定
                em.close();

                request.getSession().setAttribute("flush", "変更が完了しました。");

                // セッションスコープ上の不要になったデータを削除
                request.getSession().removeAttribute("useridpk");

                response.sendRedirect(request.getContextPath() + "/users/show");
            }
        }
    }

}
