/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.doctor.servlet;

import com.dao.DoctorDAO;
import com.db.Database;
import com.entity.Doctor;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hiral
 */
@WebServlet(name = "EditProfile", urlPatterns = "/DoctorUpdateProfile")
public class EditProfile extends HttpServlet {

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
    //            out.println("<title>Servlet EditProfile</title>");            
    //            out.println("</head>");
    //            out.println("<body>");
    //            out.println("<h1>Servlet EditProfile at " + request.getContextPath() + "</h1>");
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

        try{
            String Fullname = request.getParameter("fullname");
            String Dob = request.getParameter("dob");
            String Qualification = request.getParameter("qualification");
            String Specialist = request.getParameter("specialist");
            String Email = request.getParameter("email");
            String Mobno = request.getParameter("mobno");
            int Id = Integer.parseInt(request.getParameter("id"));
            
            Doctor doc = new Doctor(Id,Fullname,Dob,Qualification,Specialist,Email,Mobno,"");
            
            DoctorDAO dao = new DoctorDAO(Database.getConnection());
            HttpSession session = (HttpSession) request.getSession();
            
            if(dao.editDoctorProfile(doc)){
                Doctor updateDoctor = dao.getDoctorById(Id);
                session.setAttribute("messaged", "Doctor Added Successfully");
                session.setAttribute("DoctorObj", updateDoctor);
                response.sendRedirect("Doctor/edit_profile.jsp");
            }
            else{
                session.setAttribute("error_messaged", "Doctor Added Successfully");
                response.sendRedirect("Doctor/edit_profile.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
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
