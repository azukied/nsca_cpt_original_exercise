package controllers.practice_exams;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Chapter;

/**
 * Servlet implementation class PracticeExamsResultServlet
 */
@WebServlet("/practice_exams/result")
public class PracticeExamsResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PracticeExamsResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("chapter", (Chapter)request.getSession().getAttribute("chapter"));

        request.getSession().removeAttribute("chapter_id");
        request.getSession().removeAttribute("chapter");
        request.getSession().removeAttribute("list_size");
        request.getSession().removeAttribute("exercise");

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/practiceExams/result.jsp");
        rd.forward(request, response);
    }

}
