/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dao.DAOSorteo;
import Modelo.Sorteo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author wbolivarc
 */
public class ServletSorteo extends HttpServlet {

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
            out.println("<title>Servlet ServletSorteo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletSorteo at " + request.getContextPath() + "</h1>");
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
        int numero = Integer.parseInt(request.getParameter("numeroSorteo"));
        int estado = Integer.parseInt(request.getParameter("estado"));
        int premio = Integer.parseInt(request.getParameter("premio"));

        DAOSorteo dao = new DAOSorteo();
        Sorteo s = dao.ObtenerNumero(numero);
        
        System.out.println(s.getNombre());
        
        if (s.getNombre() != null) {
            System.out.println(s.getId_rifa());
            System.out.println(s.getNumero());
            System.out.println(s.getNombre());
            System.out.println(s.getTelefono());

            if (estado == 2) {
                dao.add_Agua(s, premio);
                System.out.println("AGUA");
                response.sendRedirect("Premio.jsp?premio=" + premio);
            } else {
                dao.add_Ganador(s, premio);
                System.out.println("GANADOR");
                response.sendRedirect("Premio.jsp?premio=" + premio);
            }
        } else {
            request.getSession().setAttribute("sinRegistro", "Numero sin registro.");
            
            response.sendRedirect("Premio.jsp?premio=" + premio);
            System.out.println("AUN NO HAY REGISTRO");
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






