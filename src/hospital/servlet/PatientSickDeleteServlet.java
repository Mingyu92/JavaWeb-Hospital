package hospital.servlet;

import hospital.dao.impl.SickDaoImpl;
import hospital.service.AdminService;
import hospital.service.DoctorService;
import hospital.service.PatientService;
import hospital.user.Patient;
import hospital.user.Sick;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

public class PatientSickDeleteServlet extends HttpServlet {
    DoctorService doctorService=new DoctorService();
    PatientService patientService=new PatientService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int UserID = Integer.parseInt(req.getParameter("UserID"));
        int AppointmentID = Integer.parseInt(req.getParameter("AppointmentID"));
        boolean flag = doctorService.SickDelete(AppointmentID);
        if (flag) {
            req.setAttribute("Errormessage", "取消挂号成功！");
            req.setAttribute("UserID", UserID);
            req.getRequestDispatcher("PatientCenter.jsp").forward(req, resp);
        } else {
            req.setAttribute("Errormessage", "取消挂号失败！");
            req.getRequestDispatcher("PatientCenter.jsp").forward(req, resp);
        }
    }
}
