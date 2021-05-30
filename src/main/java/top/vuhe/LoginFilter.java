package top.vuhe;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

/**
 * @author zhuhe
 */
public class LoginFilter implements Filter {
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "admin";

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpSession session = req.getSession();

        // 获得cookie中用户名和密码 进行登录的操作
        String cookieUsername = null;
        String cookiePassword = null;
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName())) {
                    cookieUsername = cookie.getValue();
                    cookieUsername = URLDecoder.decode(cookieUsername,
                            StandardCharsets.UTF_8);
                }
                if ("password".equals(cookie.getName())) {
                    cookiePassword = cookie.getValue();
                }
            }
        }

        if (cookieUsername != null && cookiePassword != null) {
            if (USERNAME.equals(cookieUsername) && PASSWORD.equals(cookiePassword)) {
                session.setAttribute("username", cookieUsername);
                session.setAttribute("password", cookiePassword);
            }
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
    }
}
