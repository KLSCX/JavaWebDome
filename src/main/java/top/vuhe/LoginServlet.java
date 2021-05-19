package top.vuhe;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author zhuhe
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Map<String, UserDetail> MAP = new HashMap<>(4);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取用户名
        String username = request.getParameter("user");
        // 获取密码
        String password = request.getParameter("password");
        // 获取生日
        String birthday = request.getParameter("birthday");
        // 获取邮箱
        String email = request.getParameter("email");
        // 检查用户和密码
        UserDetail user = MAP.getOrDefault(username, null);
        if (user != null && user.getPassword().equals(password)) {
            // 正确跳转欢迎页
            response.sendRedirect(request.getContextPath() + "/ex3/welcome.jsp?user=" + user);
        }  else {
            // 错误跳转回登录页
            request.getRequestDispatcher("/ex3/login.jsp").forward(request, response);
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
