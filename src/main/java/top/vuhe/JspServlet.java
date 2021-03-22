package top.vuhe;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author zhuhe
 */
public class JspServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 获取 session
        HttpSession session = req.getSession();
        // 获取 Application
        ServletContext application = this.getServletContext();
        // 获取 ServletConfig
        ServletConfig config = this.getServletConfig();
    }
}
