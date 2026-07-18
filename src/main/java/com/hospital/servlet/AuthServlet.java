package com.hospital.servlet;

import com.hospital.dao.AuthDAO;
import com.hospital.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    private final AuthDAO authDAO = new AuthDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (!"login".equals(action)) {
            response.sendRedirect(request.getContextPath() + "/Pages/login.jsp?error=invalid");
            return;
        }

        try {
            User user = authDAO.authenticate(role, username, password);

            if (user != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                session.setAttribute("role", user.getRole());

                response.sendRedirect(request.getContextPath() + "/Pages/patientVisit.jsp");
                return;
            }

            // Login failed for the submitted role - check if this username
            // actually belongs to a different role, to give a clearer message.
            String actualRole = authDAO.findActualRole(username, role);

            if (actualRole != null) {
                response.sendRedirect(request.getContextPath() + "/Pages/login.jsp?error=role");
            } else {
                response.sendRedirect(request.getContextPath() + "/Pages/login.jsp?error=invalid");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Pages/login.jsp?error=invalid");
        }
    }
}