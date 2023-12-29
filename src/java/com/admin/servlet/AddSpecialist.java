/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDAO;
import com.db.Database;
//import com.entity.Specialist;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author Hiral
 */
@WebServlet(name = "AddSpecialist", urlPatterns = "/AddSpecialist")
public class AddSpecialist extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddSpecialist</title>");            
            out.println("</head>");
            out.println("<body>");
        //    out.println("<h1>Servlet AddSpecialist at " + request.getContextPath() + "</h1>");
//            response.sendRedirect("./Admin/index.jsp");
            out.println("</body>");
            out.println("</html>");
        }
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
//        processRequest(request, response);
        
        PrintWriter out = response.getWriter();
        String specName = request.getParameter("specName");
        
        HttpSession session = request.getSession();
        if (specName.isEmpty()) {
            session.setAttribute("error_message", "Please enter a valid specialist name");
            response.getWriter().write("error");
        } else {
            SpecialistDAO dao = new SpecialistDAO(Database.getConnection());
            if (dao.isSpecialistExists(specName)) {
                response.setContentType("application/json");
                session.setAttribute("message", "Specialist already exists");
                response.getWriter().write("{\"msg\": \"already present\"}");
            } else {
                boolean success = dao.addSpecialist(specName);
                System.out.println("Hi");
                if (success) {
                    response.setContentType("application/json");
                    session.setAttribute("message", "Specialist Added");
                    response.getWriter().write("{\"msg\": \"success\"}");
                } else {
                    response.setContentType("application/json");
                    session.setAttribute("error_message", "Something went wrong on the server");
                    response.getWriter().write("error");
                }
            }
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
