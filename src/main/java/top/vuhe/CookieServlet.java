package top.vuhe;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 * @author zhuhe
 */
public class CookieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "admin";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        //登录成功
        if (USERNAME.equals(username) && PASSWORD.equals(password)) {
            String autoLogin = request.getParameter("autoLogin");
            if (autoLogin != null) {
                //编码是为了在cookie中存储汉字
                String usernameCode = URLEncoder.encode(username, StandardCharsets.UTF_8);

                Cookie usernameCookie = new Cookie("username", usernameCode);
                Cookie passwordCookie = new Cookie("password", password);
                int time = 0;
                //设置持久化时间
                switch (autoLogin) {
                    case "1": time = 30 * 24 * 60 * 60;break;
                    case "2": time = 3 * 30 * 24 * 60 * 60; break;
                    case "3": time = 6 * 30 * 24 * 60 * 60; break;
                    default: break;
                }
                usernameCookie.setMaxAge(time);
                passwordCookie.setMaxAge(time);
                //设置cookie携带路径
                usernameCookie.setPath(request.getContextPath() + "/exm4/login.jsp");
                passwordCookie.setPath(request.getContextPath() + "/exm4/login.jsp");
                //发送cookie
                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }

            session.setAttribute("username", username);
            session.setAttribute("password", password);
            response.sendRedirect(request.getContextPath() + "/exm4/success.jsp");
        } else {
            request.getRequestDispatcher(request.getContextPath() + "/exm4/login.jsp").forward(request, response);
        }
    }
}
