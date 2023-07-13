package hospital.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hospital.dao.impl.DepartmentDaoimpl;
import hospital.dao.impl.SickDaoImpl;
import hospital.user.Department;
import hospital.user.Sick;

public class UpdateSickServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int patientID = Integer.parseInt(request.getParameter("patientID"));
        int sickID = Integer.parseInt(request.getParameter("sickID"));
        //System.out.println(sickID);
        String patient = request.getParameter("patient");
        String hospital = request.getParameter("hospital");
        String departmentname = request.getParameter("departmentname");
        String docter = request.getParameter("docter");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String status = request.getParameter("status");
        String pay = request.getParameter("pay");
        String payamount = request.getParameter("payamount");


        SickDaoImpl sickdaoimpl = new SickDaoImpl();
        Sick sick = sickdaoimpl.findById(sickID);
        sick.setPatientId(patientID);
        sick.setP_name(patient);
        sick.setHospitalname(hospital);
        sick.setDepartmentname(departmentname);
        sick.setD_name(docter);
        sick.setData(date);
        sick.setTime(time);
        sick.setAppointmentstatus(status);
        sick.setPaymentstatus(pay);
        sick.setPaymentamount(payamount);

        boolean success = sickdaoimpl.update(sick); // 调用 DAO 类的更新方法
        System.out.println(success);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (success) {
            out.println("<script>");
            out.println("alert('预约信息已成功更新！');");
            out.println("window.location.href='./AdminSick.jsp?patientID=" + patientID + "';"); // 更新成功后重定向到科室管理页面
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('预约信息更新失败，请重试！');");
            out.println("window.location.href='./AdminSick.jsp?patientID=" + patientID + "';"); // 更新失败后重定向到科室管理页面
            out.println("</script>");
        }

        out.close();
    }
}