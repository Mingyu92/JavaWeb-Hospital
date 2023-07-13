package hospital.servlet;

import hospital.dao.impl.DepartmentDaoimpl;
import hospital.dao.impl.HospitalDaoImpl;
import hospital.user.Department;
import hospital.user.Hospital;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddDepartmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 从表单中获取科室信息
        int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
        String name = request.getParameter("name");
        String head = request.getParameter("head");
        String introduction = request.getParameter("introduction");
        String time = request.getParameter("time");

        // 创建科室对象，并设置属性值
        Department department = new Department();
        department.setHospitalid(hospitalId);
        department.setDepartmentname(name);
        department.setDepartmenthead(head);
        department.setIntroduction(introduction);
        department.setClinichours(time);

        // 调用 DAO 层的方法将医院对象保存到数据库
        DepartmentDaoimpl departmentdaoimpl = new DepartmentDaoimpl();
        departmentdaoimpl.add(department);

        // 返回到 AdminDepartment.jsp 页面
        response.sendRedirect("./AdminDepartment.jsp?hospitalId=" + hospitalId);
    }
}