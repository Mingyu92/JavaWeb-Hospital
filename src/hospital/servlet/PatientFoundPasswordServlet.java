package hospital.servlet;

import hospital.service.PatientService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Objects;

public class PatientFoundPasswordServlet extends HttpServlet {
    PatientService patientService=new PatientService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String PhoneNumber =req.getParameter("PhoneNumber");
        String name=req.getParameter("name");
        String idCard=req.getParameter("idCard");
        String password=req.getParameter("password");
        String SurePassword = req.getParameter("SurePassword");

        if(!Objects.equals(password, SurePassword)){
            req.setAttribute("Errormessage","密码不一致，请重新输入");
            req.getRequestDispatcher("PatientFoundPassword.jsp").forward(req,resp);
        }

        boolean flag=patientService.SickFoundPassword(PhoneNumber,name,idCard,password);
        if(flag){
            req.setAttribute("Errormessage", "找回密码成功!");
            req.getRequestDispatcher("PatientLogin.jsp").forward(req, resp);
        }
        else {
            req.setAttribute("Errormessage", "信息有误！找回密码失败");
            req.getRequestDispatcher("PatientFoundPassword.jsp").forward(req, resp);
        }
    }
}
