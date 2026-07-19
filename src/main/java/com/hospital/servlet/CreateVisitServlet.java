package com.hospital.servlet;

import com.hospital.dao.VisitDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/createVisit")
public class CreateVisitServlet extends HttpServlet {

    private final VisitDAO visitDAO = new VisitDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String contextPath = request.getContextPath();

        if (session == null || !"PATIENT".equals(session.getAttribute("role"))) {
            response.sendRedirect(contextPath + "/Pages/login.jsp");
            return;
        }

        Integer patientIdObj = (Integer) session.getAttribute("userId");
        String patientName = (String) session.getAttribute("fullName");
        String contactNumber = (String) session.getAttribute("phoneNumber");
        String symptoms = request.getParameter("symptoms");

        if (patientIdObj == null) {
            // Session invalid — redirect to login
            response.sendRedirect(contextPath + "/Pages/login.jsp");
            return;
        }

        int patientId = patientIdObj;
        int newVisitId = -1;
        try {
            newVisitId = visitDAO.createVisit(patientId, patientName, contactNumber, symptoms);
            System.out.println("[CreateVisitServlet] createVisit returned id=" + newVisitId + " for patientId=" + patientId + " symptoms='" + symptoms + "'");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (newVisitId > 0) {
            // Redirect the patient to the newly-created EMR so reception will see it in their queue.
            response.sendRedirect(contextPath + "/Pages/emr.jsp?visitId=" + newVisitId);
        } else {
            // Fallback: go back to dashboard with an error (server logs contain the cause)
            request.getSession().setAttribute("flashError", "Could not create visit — please try again.");
            response.sendRedirect(contextPath + "/Pages/patient.jsp");
        }
    }
}