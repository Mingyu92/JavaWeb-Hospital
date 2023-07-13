package hospital.servlet;

import hospital.service.DoctorService;
import hospital.service.PatientService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class PatientSickPaymentServlet extends HttpServlet {
    DoctorService doctorService=new DoctorService();
    PatientService patientService=new PatientService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int UserID = Integer.parseInt(req.getParameter("UserID"));
        int AppointmentID = Integer.parseInt(req.getParameter("AppointmentID"));
        boolean flag = doctorService.SickUpdate(AppointmentID);
        if (flag) {
            req.setAttribute("Errormessage", "缴费成功！");
            req.setAttribute("UserID", UserID);
            req.getRequestDispatcher("PatientSickShow.jsp").forward(req, resp);
        } else {
            req.setAttribute("Errormessage", "缴费失败！");
            req.getRequestDispatcher("PatientSickShow.jsp").forward(req, resp);
        }
    }
}
