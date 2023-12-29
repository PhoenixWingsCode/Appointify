/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user.servlet;

import com.dao.AppointmentDAO;
import com.db.Database;
import com.entity.Appointment;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hiral
 */
@WebServlet(name = "AppointmentServlet", urlPatterns = "/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Appointment</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Appointment at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        String fullName = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String appointmentDate = request.getParameter("appoint_date");
        String email = request.getParameter("email");
        String phno = request.getParameter("phoneNo");
        String diseases = request.getParameter("diseases");
        int doctor_id = Integer.parseInt(request.getParameter("doctor"));
        String address = request.getParameter("address");
        
        Appointment app = new Appointment(userId,fullName,gender,age,appointmentDate,email,phno,diseases,doctor_id,address,"pending");

        AppointmentDAO dao = new AppointmentDAO(Database.getConnection());
        HttpSession session = request.getSession();
        
        if(dao.addAppointment(app)){
            session.setAttribute("succMsg", "Appointment Successfully");
            response.sendRedirect("User/user_appointment.jsp");
        }else{
            session.setAttribute("errorMsg", "Something wrond on server");
            response.sendRedirect("User/user_appointment.jsp");        
        }
}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
