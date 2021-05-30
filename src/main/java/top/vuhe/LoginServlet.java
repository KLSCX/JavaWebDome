package top.vuhe;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zhuhe
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Map<String, UserDetail> MAP = new HashMap<>(4) {{
        UserDetail userDetail = new UserDetail();
        userDetail.setId(1);
        userDetail.setUsername("admin");
        userDetail.setPassword("admin");
        userDetail.setBirthday("2000-1-1");
        userDetail.setEmail("test@test.com");
        put("admin", userDetail);
    }};

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取用户名
        String username = request.getParameter("user");
        // 获取密码
        String password = request.getParameter("password");
        // 检查用户和密码
        UserDetail user = MAP.getOrDefault(username, null);
        if (user != null && user.getPassword().equals(password)) {
            // 正确跳转欢迎页
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/exm5/success.jsp");
        }  else {
            // 错误跳转回登录页
            request.getRequestDispatcher("/exm5/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取用户名
        String username = request.getParameter("user");
        // 获取密码
        String password = request.getParameter("password");
        // 获取生日
        String birthday = request.getParameter("birthday");
        // 获取邮箱
        String email = request.getParameter("email");
        UserDetail user = new UserDetail(null, username, password, birthday, email);
        System.out.println(user);
        MAP.put(username, user);
        request.getRequestDispatcher("/ex3/login.jsp").forward(request, response);
    }
}
