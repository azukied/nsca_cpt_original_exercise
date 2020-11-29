package controllers.login;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());    // CSRF対策
        request.setAttribute("hasError", false);

        // セッションスコープにフラッシュメッセージが登録されていれば、それをリクエストスコープに登録し直す。
        if (request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
        rd.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 認証結果を格納する変数
        Boolean check_result = false;    // DBに保存されているユーザデータとの照合が取れれば、あとでtrueが代入される。

        String user_id = request.getParameter("user_id");
        String plain_pass = request.getParameter("plain_pass");

        User u = null;

        // ユーザIDとパスワードが入力されていれば、以下を実行する。
        if (user_id != null && !user_id.equals("") && plain_pass != null && !plain_pass.equals("")) {
            EntityManager em = DBUtil.createEntityManager();

            // ログイン時にフォームから受け取ったパスワードをハッシュ化
            String password = EncryptUtil.getPasswordEncrypt(
                                   plain_pass,
                                   (String)this.getServletContext().getAttribute("pepper")
                               );

            // ユーザIDとパスワードが正しいかチェック
            try {
                u = em.createNamedQuery("checkLoginUserIdAndPassword", User.class)
                      .setParameter("user_id", user_id)
                      .setParameter("password", password)
                      .getSingleResult();
            } catch (NoResultException ex) {}

            em.close();

            if (u != null) {
                check_result = true;    // DBに保存されているユーザデータとの照合が取れれば、trueを代入
            }
        }

        // 認証できなければログイン画面へ戻る。
        if (!check_result) {
            request.setAttribute("_token", request.getSession().getId());    // CSRF対策
            request.setAttribute("hasError", true);
            request.setAttribute("user_id", user_id);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login/login.jsp");
            rd.forward(request, response);
        // 認証できればログイン状態にしてトップページへリダイレクト
        } else {
            request.getSession().setAttribute("login_user", u);    // 「セッションスコープにlogin_userという名前でユーザデータのオブジェクトが保存されている状態」をログインしている状態とする。
            request.getSession().setAttribute("flush", "ログインしました。");
            response.sendRedirect(request.getContextPath() + "/index.html");
        }
    }

}
