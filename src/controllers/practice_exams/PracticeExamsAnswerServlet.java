package controllers.practice_exams;

import java.io.IOException;
import java.util.HashSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Exercise;

/**
 * Servlet implementation class PracticeExamsAnswerServlet
 */
@WebServlet("/practice_exams/answer")
public class PracticeExamsAnswerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PracticeExamsAnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list_index", request.getParameter("list_index"));

        String correct_answer = request.getParameter("correct_answer");
        request.setAttribute("correct_answer", correct_answer);

        // テスト結果画面に正解数を表示するためのコード
        HashSet<Integer> correctlly_answered_questions;

        if (request.getSession().getAttribute("correctlly_answered_questions") == null) {
            correctlly_answered_questions = new HashSet<Integer>();
        } else {
            correctlly_answered_questions = (HashSet<Integer>)request.getSession().getAttribute("correctlly_answered_questions");
        }

        if (correct_answer.equals(((Exercise)request.getSession().getAttribute("exercise")).getCorrect_answer())) {
            correctlly_answered_questions.add(((Exercise)request.getSession().getAttribute("exercise")).getId());
        }

        request.getSession().setAttribute("correctlly_answered_questions", correctlly_answered_questions);
        //

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/practiceExams/answer.jsp");
        rd.forward(request, response);
    }

}
