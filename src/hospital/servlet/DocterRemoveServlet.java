package hospital.servlet;

import hospital.dao.impl.DoctorDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DocterRemoveServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            int hospitalId = Integer.parseInt(request.getParameter("hospitalId"));
            int departmentId = Integer.parseInt(request.getParameter("departmentId"));
            int docterId = Integer.parseInt(request.getParameter("docterId"));
            DoctorDaoImpl docterdaoimpl = new DoctorDaoImpl();
            docterdaoimpl.delete(docterId);
            //System.out.println(departmentId);
            response.sendRedirect("./AdminDocter.jsp?hospitalId=" + hospitalId + "&departmentId=" + departmentId);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
