package hospital.servlet;

import hospital.dao.impl.DepartmentDaoimpl;
import hospital.user.Department;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

public class UpdateDepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String A_Name = request.getParameter("A_Name");
        int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
        int id = Integer.parseInt(request.getParameter("D_Id"));
        //System.out.println(id);
        String name = request.getParameter("name");
        String head = request.getParameter("head");
        String introduction = request.getParameter("introduction");
        String time = request.getParameter("time");


        DepartmentDaoimpl departmentdaoimpl = new DepartmentDaoimpl();
        Department department = departmentdaoimpl.find(id);
        department.setDepartmentname(name);
        department.setDepartmenthead(head);
        department.setIntroduction(introduction);
        department.setClinichours(time);

        boolean success = departmentdaoimpl.update(department); // 调用 DAO 类的更新方法
        //System.out.println(success);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (success) {
            out.println("<script>");
            out.println("alert('科室信息已成功更新！');");
            out.println("window.location.href='./AdminDepartment.jsp?hospitalId=" + hospitalId + "&A_Name=" + URLEncoder.encode(A_Name, "UTF-8") + "';"); // 更新成功后重定向到科室管理页面
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('科室信息更新失败，请重试！');");
            out.println("window.location.href='./AdminDepartment.jsp?hospitalId=" + hospitalId + "&A_Name=" + URLEncoder.encode(A_Name, "UTF-8") + "';"); // 更新成功后重定向到科室管理页面
            out.println("</script>");
        }

        out.close();
    }
}