package hospital.servlet;

import hospital.dao.impl.DepartmentDaoimpl;
import hospital.dao.impl.HospitalDaoImpl;
import hospital.service.DoctorService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Administrator
 * 医生数据更新响应
 */
public class DoctorUpdateServlet extends HttpServlet {
    DoctorService doctorService=new DoctorService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HospitalDaoImpl hospitalDao = new HospitalDaoImpl();
        DepartmentDaoimpl departmentDaoimpl = new DepartmentDaoimpl();

        int id= Integer.valueOf(req.getParameter("id"));
        String name=req.getParameter("name");
        int age= Integer.valueOf(req.getParameter("age"));
        String sex=req.getParameter("sex");
        String phone = req.getParameter("phone");
        int HospitalId = Integer.valueOf(req.getParameter("Hospital"));
        String Hospital = hospitalDao.find(HospitalId).getName();
        int DepartmentId = Integer.valueOf(req.getParameter("Department"));
        String Department = departmentDaoimpl.findone(DepartmentId).getDepartmentname();
        String ProfessionalTitle = req.getParameter("ProfessionalTitle");
        String Introduction = req.getParameter("Introduction");

        boolean flag=doctorService.DoctorUpdate(id,name,HospitalId, DepartmentId, age,sex,phone,Hospital,Department,ProfessionalTitle,Introduction);
        if(flag){
            resp.getWriter().write("医生数据更新成功!");
            /*使用转发,因为DoctorShow界面获参的方法为getAttribute*/
            req.setAttribute("id",id);
            req.getRequestDispatcher("DoctorShow.jsp").forward(req,resp);
        }
        else{
            resp.getWriter().write("医生数据更新失败!");
            resp.sendRedirect("Error.jsp");
        }
    }
}
