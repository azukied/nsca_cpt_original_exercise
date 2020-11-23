package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor.
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String context_path = ((HttpServletRequest)request).getContextPath();
        String servlet_path = ((HttpServletRequest)request).getServletPath();

        if (!servlet_path.matches("/css.*") && !servlet_path.matches("/index.html")) {    // CSSフォルダ内とトップページは認証処理から除外する。
            HttpSession session = ((HttpServletRequest)request).getSession();

            // セッションスコープに保存されたログインユーザ情報を取得
            User u =(User)session.getAttribute("login_user");

            // ログイン画面以外について
            if (!servlet_path.equals("/login")) {
                // ログアウトしている状態であれば、ログイン画面にリダイレクト
                if (u == null) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/login");
                    return;
                }

                // ログインしている状態でも、練習問題作成に関する操作は管理者のみが行えるようにする。
                if (servlet_path.matches("/exercises.*") && u.getAdmin_flag() == 0) {
                    ((HttpServletRequest)request).getSession().setAttribute("flush", "アクセスしようとしたページは、管理者のみアクセス可能です。");
                    ((HttpServletResponse)response).sendRedirect(context_path + "/index.html");
                    return;
                }
            // ログイン画面について
            } else {
                // ログインしているのにログイン画面にアクセスした場合は、トップページにリダイレクト
                if (u != null) {
                    ((HttpServletResponse)response).sendRedirect(context_path + "/index.html");
                    return;
                }
            }
        }

        chain.doFilter(request, response);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}
