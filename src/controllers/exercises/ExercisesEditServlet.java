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
 * Servlet implementation class ExercisesEditServlet
 */
@WebServlet("/exercises/edit")
public class ExercisesEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExercisesEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        // 該当のIDの練習問題データ1件のみをDBから取得
        Exercise e = em.find(Exercise.class, Integer.parseInt(request.getParameter("exercise_id")));

        em.close();

        // 練習問題データとセッションIDをリクエストスコープに登録
        request.setAttribute("exercise", e);
        request.setAttribute("_token", request.getSession().getId());    // CSRF対策
        request.getSession().setAttribute("exercise_id", e.getId());    // ちゃんと該当のIDの問題を上書きするためにこれは必須！

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/exercises/edit.jsp");
        rd.forward(request, response);
    }

}
