package hospital.servlet;

import hospital.dao.impl.SickDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SickRemoveServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            int patientID = Integer.parseInt(request.getParameter("patientID"));
            int sickID = Integer.parseInt(request.getParameter("sickID"));
            SickDaoImpl sickdaoimpl = new SickDaoImpl();
            sickdaoimpl.delete(sickID);
            //System.out.println(departmentId);
            response.sendRedirect("./AdminSick.jsp?patientID=" + patientID);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
