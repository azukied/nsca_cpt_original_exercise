package controllers.exercises;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Exercise;

/**
 * Servlet implementation class ExercisesNewServlet
 */
@WebServlet("/exercises/new")
public class ExercisesNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExercisesNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());    // CSRF対策
        // おまじないとしてのインスタンスを生成
        request.setAttribute("exercise", new Exercise());
        
        request.setAttribute("chapter_id", Integer.parseInt(request.getParameter("chapter_id")));
        
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/exercises/new.jsp");
        rd.forward(request, response);
    }

}
