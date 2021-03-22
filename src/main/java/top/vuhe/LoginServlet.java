package top.vuhe;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author zhuhe
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取用户名
        String user = request.getParameter("user");
        // 获取密码
        String password = request.getParameter("password");
        // 控制台打印
        System.err.println(user + ";" + password);
        // 检查用户和密码
        if ("admin".equals(user) && "123456".equals(password)) {
            // 正确跳转欢迎页
            response.sendRedirect(request.getContextPath() + "/ex3/welcome.jsp?user=" + user);
        } else {
            // 错误跳转回登录页
            request.getRequestDispatcher("/ex3/login.jsp").forward(request, response);
        }
    }
}
