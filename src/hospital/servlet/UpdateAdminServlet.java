package hospital.servlet;

import hospital.dao.impl.AdminDaoImpl;
import hospital.user.Admin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UpdateAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int A_Id = Integer.parseInt(request.getParameter("A_Id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");
        String repwd = request.getParameter("repwd");
        if (pwd.equals(repwd)) {
            AdminDaoImpl admindaoimpl = new AdminDaoImpl();
            Admin admin = admindaoimpl.findID(A_Id);
            admin.setA_Name(name);
            admin.setA_phone(phone);
            admin.setA_password(pwd);

            boolean success = admindaoimpl.update(admin); // 调用 DAO 类的更新方法
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            if (success) {
                out.println("<script>");
                out.println("alert('管理员信息已成功更新！');");
                out.println("window.location.href = './AdminCenter.jsp?A_Name=" + name + "';");
                out.println("</script>");
            } else {
                out.println("<script>");
                out.println("alert('管理员信息更新失败，请重试！');");
                out.println("window.location.href = './AdminCenter.jsp?A_Name=" + name + "';");
                out.println("</script>");
            }

            out.close();

        } else {
            String message = "两次密码不相等，请重新输入";
            request.setAttribute("message", message);
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert(message);");
            out.println("window.location.href='./AdminInformation.jsp?A_Name=" + name + "';"); // 更新成功后重定向到科室管理页面
            out.println("</script>");
        }


    }
}
