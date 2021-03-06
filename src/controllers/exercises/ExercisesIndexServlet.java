package controllers.exercises;

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
import models.Exercise;
import utils.DBUtil;

/**
 * Servlet implementation class ExercisesIndexServlet
 */
@WebServlet("/exercises/index")
public class ExercisesIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExercisesIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer chapter_id = Integer.parseInt(request.getParameter("chapter_id"));

        EntityManager em = DBUtil.createEntityManager();

        // ページネーション
        // 開くページ数を取得（デフォルトは1ページ目）
        int page = 1;

        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) { }

        // 最大件数と開始位置を指定して本章の練習問題を取得
        List<Exercise> exercises = em.createNamedQuery("getExercisesFromEachChapterId", Exercise.class)
                                      .setParameter("chapter_id", chapter_id)
                                      .setFirstResult(20 * (page - 1))    // 何件目からデータを取得するか。（配列と同じ0番目から数える。）
                                      .setMaxResults(20)    // データの最大取得件数
                                      .getResultList();

        // 本章の練習問題件数を取得
        long exercises_count = (long)em.createNamedQuery("getExercisesCountFromEachChapterId", Long.class)
                                         .setParameter("chapter_id", chapter_id)
                                         .getSingleResult();

        // 本章の章データを取得
        Chapter chapter = em.createNamedQuery("getChapterFromId", Chapter.class)
                              .setParameter("chapter_id", chapter_id)
                              .getSingleResult();

        em.close();

        request.setAttribute("chapter_id", chapter_id);
        request.setAttribute("exercises", exercises);
        request.setAttribute("exercises_count", exercises_count);
        request.setAttribute("page", page);
        request.setAttribute("chapter", chapter);

        // セッションスコープにフラッシュメッセージが登録されていれば、それをリクエストスコープに登録し直す。
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/exercises/index.jsp");
        rd.forward(request, response);
    }

}
