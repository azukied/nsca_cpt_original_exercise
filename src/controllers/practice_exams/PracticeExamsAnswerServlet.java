package controllers.practice_exams;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("list_index", request.getParameter("list_index"));
        request.setAttribute("correct_answer", request.getParameter("correct_answer"));

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/practiceExams/answer.jsp");
        rd.forward(request, response);
    }

}
