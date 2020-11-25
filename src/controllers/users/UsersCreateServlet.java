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
 * Servlet implementation class UsersCreateServlet
 */
@WebServlet("/users/create")
public class UsersCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersCreateServlet() {
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

            User u = new User();

            // new.jspのフォームから受け取ったデータをセット
            u.setNickname(request.getParameter("nickname"));
            u.setUser_id(request.getParameter("user_id"));
            u.setPassword(
                EncryptUtil.getPasswordEncrypt(
                    request.getParameter("plain_pass"),
                    (String)this.getServletContext().getAttribute("pepper")
                )
            );
            u.setAdmin_flag(Integer.parseInt(request.getParameter("admin_flag")));

            // 確認用パスワードもハッシュ化
            // （ハッシュ化したパスワードとハッシュ化した確認用パスワードの一致をあとで確認）
            String conf_pass = EncryptUtil.getPasswordEncrypt(
                                    request.getParameter("plain_conf_pass"),
                                    (String)this.getServletContext().getAttribute("pepper")
                                );

            // バリデーションを実行
            List<String> errors = UserValidator.validate(u, conf_pass, true, true);
            // エラーがあれば新規登録フォームに戻る。
            if (errors.size() > 0) {
                em.close();

                // フォームに初期値を設定した状態でエラーメッセージを送る。
                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("user", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/new.jsp");
                rd.forward(request, response);
            // エラーがなければデータを保存してトップページへ移動
            } else {
                em.getTransaction().begin();
                em.persist(u);    // DBに保存
                em.getTransaction().commit();    // データの新規登録を確定
                em.close();

                request.getSession().setAttribute("flush", "登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/index.html");
            }
        }
    }

}
