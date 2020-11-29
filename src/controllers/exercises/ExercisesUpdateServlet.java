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
import models.validators.ExerciseValidator;
import utils.DBUtil;

/**
 * Servlet implementation class ExercisesUpdateServlet
 */
@WebServlet("/exercises/update")
public class ExercisesUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExercisesUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        Integer chapter_id = Integer.parseInt(request.getParameter("chapter_id"));
        // CSRF対策のチェックを実行
        if (_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Exercise e = em.find(Exercise.class, (Integer)(request.getSession().getAttribute("exercise_id")));

            // 以下、e.set～で、フォームから受け取ったデータで各フィールドを上書き
            e.setId(Integer.parseInt(request.getParameter("id")));

            Chapter chapter = em.createNamedQuery("getChapterFromId", Chapter.class)
                                  .setParameter("chapter_id", chapter_id)
                                  .getSingleResult();
            e.setChapter(chapter);

            e.setQuestion(request.getParameter("question"));
            e.setChoice_a(request.getParameter("choice_a"));
            e.setChoice_b(request.getParameter("choice_b"));
            e.setChoice_c(request.getParameter("choice_c"));
            e.setChoice_d(request.getParameter("choice_d"));
            e.setCorrect_answer(request.getParameter("correct_answer"));
            e.setExplanation(request.getParameter("explanation"));

            // バリデーションを実行
            List<String> errors = ExerciseValidator.validate(e);
            // エラーがあれば新規登録フォームに戻る。
            if (errors.size() > 0) {
                em.close();

                // フォームに初期値を設定した状態でエラーメッセージを送る。
                request.setAttribute("_token", request.getSession().getId());    // CSRF対策
                request.setAttribute("exercise", e);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/exercises/edit.jsp");
                rd.forward(request, response);
            // エラーがなければデータを変更してトップページへ移動
            } else {
                em.getTransaction().begin();    // DBから取得した練習問題データを変更してコミットすれば反映されるので、em.persist(e);は不要
                em.getTransaction().commit();    // 練習問題データの変更を確定
                em.close();

                request.getSession().setAttribute("flush", "変更が完了しました。");

                Integer exercise_id = (Integer)request.getSession().getAttribute("exercise_id");
                // セッションスコープ上の不要になったデータを削除
                request.getSession().removeAttribute("exercise_id");

                response.sendRedirect(request.getContextPath() + "/exercises/show?id=" + exercise_id);
            }
        }
    }

}
