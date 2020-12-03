package controllers.practice_exams;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class PracticeExamsAnswerServlet
 */
@WebServlet("/practice_exams/question")
public class PracticeExamsQuestionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PracticeExamsQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer chapter_id;
        if (request.getParameter("chapter_id") != null) {
            chapter_id = Integer.parseInt(request.getParameter("chapter_id"));
            request.getSession().setAttribute("chapter_id", chapter_id);
        } else {
            chapter_id = (Integer)(request.getSession().getAttribute("chapter_id"));
        }

        EntityManager em = DBUtil.createEntityManager();

        // 章のIDから章データを取得
        Chapter chapter = em.createNamedQuery("getChapterFromId", Chapter.class)
                              .setParameter("chapter_id", chapter_id)
                              .getSingleResult();
        request.getSession().setAttribute("chapter", chapter);

        // 本章の練習問題リストを取得
        List<Exercise> exercises = (ArrayList<Exercise>)em.createNamedQuery("getExercisesFromEachChapterId", Exercise.class)
                                                            .setParameter("chapter_id", chapter_id)
                                                            .getResultList();

        em.close();

        int list_index = 0;    // 本章の練習問題リストから取得したい問題の位置（デフォルト：0）
        if (request.getParameter("list_index") != null) {
            list_index = Integer.parseInt(request.getParameter("list_index"));
        }
        request.setAttribute("list_index", list_index);

        request.getSession().setAttribute("list_size", exercises.size());

        Exercise e = new Exercise();
        if (exercises.get(list_index) != null) {
            e = exercises.get(list_index);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/practiceExams/result.jsp");
            rd.forward(request, response);
        }

        request.getSession().setAttribute("exercise", e);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/practiceExams/question.jsp");
        rd.forward(request, response);
    }

}
