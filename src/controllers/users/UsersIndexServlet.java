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
import utils.DBUtil;

/**
 * Servlet implementation class UsersIndexServlet
 */
@WebServlet("/users/index")
public class UsersIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        // ページネーション
        // 開くページ数を取得（デフォルトは1ページ目）
        int page = 1;

        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) { }

        // 最大件数と開始位置を指定してユーザデータを取得
        List<User> users = em.createNamedQuery("getAllUsers", User.class)
                              .setFirstResult(100 * (page - 1))    // 何件目からデータを取得するか。（配列と同じ0番目から数える。）
                              .setMaxResults(100)    // データの最大取得件数
                              .getResultList();
        // ユーザ登録件数を取得
        long users_count = (long)em.createNamedQuery("getUsersCount", Long.class)
                                    .getSingleResult();

        em.close();

        request.setAttribute("users", users);
        request.setAttribute("users_count", users_count);
        request.setAttribute("page", page);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/index.jsp");
        rd.forward(request, response);
    }

}
