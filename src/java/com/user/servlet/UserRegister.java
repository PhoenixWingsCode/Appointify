    /*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
     */
    package com.user.servlet;
    
    import com.dao.UserDAO;
    
    import java.io.IOException;
    import java.io.PrintWriter;
    import javax.servlet.http.HttpSession;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    //import nl.captcha.Captcha;

    /**
     *
     * @author Hiral
     */
    @WebServlet(name = "UserRegister", urlPatterns = "/UserRegister")
    public class UserRegister extends HttpServlet{

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
                out.println("<title>Servlet UserRegister</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet UserRegister at " + request.getContextPath() + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String fullname = request.getParameter("fullname");
    String phonenumber = request.getParameter("phonenumber");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    HttpSession session = request.getSession();
    
    UserDAO dao = new UserDAO(fullname,phonenumber, email, password); // Redirect back to the signup page with an error message
    boolean registrationCheck = dao.check();
    
           if (registrationCheck) {
            // User already registered
            response.setContentType("text/plain");
            response.getWriter().write("user_exists");
        } else {
            boolean registrationSuccessful = dao.save();

            if (registrationSuccessful) {
                // Registration successful
                response.setContentType("text/plain");
                response.getWriter().write("success");
                response.sendRedirect("user_login.jsp");
            } else {
                // Registration failed
                response.setContentType("text/plain");
                response.getWriter().write("failed");
                response.sendRedirect("signup.jsp");
            }
        }
    }
}