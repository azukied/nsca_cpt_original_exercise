package controllers.toppage;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Chapter;
import models.Part;
import utils.DBUtil;

/**
 * Servlet implementation class TopPageIndexServlet
 */
@WebServlet("/index.html")
public class TopPageIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopPageIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションスコープにフラッシュメッセージが登録されていれば、それをリクエストスコープに登録し直す。
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        EntityManager em = DBUtil.createEntityManager();

        // 全ての部データをDBから取得して、リクエストスコープに登録
        List<Part> parts = em.createNamedQuery("getAllParts", Part.class)
                              .getResultList();
        request.setAttribute("parts", parts);

        // 全ての章データをDBから取得して、リクエストスコープに登録
        List<Chapter> chapters = em.createNamedQuery("getAllChapters", Chapter.class)
                                    .getResultList();
        request.setAttribute("chapters", chapters);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/index.jsp");
        rd.forward(request, response);
    }

}
