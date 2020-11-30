package controllers.exercises;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Exercise;
import utils.DBUtil;

/**
 * Servlet implementation class ExercisesDestroyServlet
 */
@WebServlet("/exercises/destroy")
public class ExercisesDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExercisesDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if (_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Exercise e = em.find(Exercise.class, (Integer)(request.getSession().getAttribute("exercise_id")));

            Integer chapter_id = e.getChapter().getId();

            em.getTransaction().begin();
            em.remove(e);    // データ削除
            em.getTransaction().commit();
            em.close();

            request.getSession().setAttribute("flush", "削除が完了しました。");

            // セッションスコープ上の不要になったデータを削除
            request.getSession().removeAttribute("exercise_id");

            response.sendRedirect(request.getContextPath() + "/exercises/index?chapter_id=" + chapter_id);
        }
    }

}
