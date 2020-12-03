package controllers.exercises;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Exercise;
import utils.DBUtil;

/**
 * Servlet implementation class ExercisesShowServlet
 */
@WebServlet("/exercises/show")
public class ExercisesShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExercisesShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションスコープにフラッシュメッセージが登録されていれば、それをリクエストスコープに登録し直す。
        if (request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        EntityManager em = DBUtil.createEntityManager();

        Exercise e = em.find(Exercise.class, Integer.parseInt(request.getParameter("exercise_id")));

        em.close();

        // 練習問題データをリクエストスコープにセットしてshow.jspを呼び出す。
        request.setAttribute("exercise", e);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/exercises/show.jsp");
        rd.forward(request, response);
    }

}
