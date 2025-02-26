package hospital.servlet;

import hospital.service.AdminService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Objects;

public class AdminLoginServlet extends HttpServlet {
    AdminService adminService=new AdminService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Captcha = req.getParameter("validationCode");
        String SureCaptcha = (String)req.getSession().getAttribute("randomCode");
        System.out.println(Captcha);
        if (!Objects.equals(Captcha, SureCaptcha)){
            req.setAttribute("Errormessage", "登录失败！验证码错误，请重新输入。");
            req.getRequestDispatcher("AdminLogin.jsp").forward(req, resp);
        }
        String A_Name = req.getParameter("A_Name");
        String A_password = req.getParameter("A_password");
        boolean flag = adminService.AdminLogin(A_Name, A_password);

        if (flag) {
            resp.getWriter().write("登录成功!");
            String url = "./AdminCenter.jsp?A_Name=" + URLEncoder.encode(A_Name, "UTF-8"); // 将A_Name作为查询参数添加到URL中
            resp.sendRedirect(url);
        } else {
            resp.getWriter().write("登录失败!");
            resp.sendRedirect("./Error.jsp");
        }
    }
}
