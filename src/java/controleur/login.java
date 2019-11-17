/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import dao.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.DataService;
import service.LoginService;

/**
 *
 * @author Marwa
 */
public class login extends HttpServlet {

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
        String dest = "";
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        HttpSession session = request.getSession();
        session.getAttribute("clients");
        Client clt = DataService.getClientByEmail(email);
        if(clt!=null){
        if ( (clt.getMotdepasse().equals(pwd)) && (clt.getEmailclient().equals(email))) {
            session.setAttribute("email", email);
            dest = "/WEB-INF/commande.jsp?locale=${loc}";
        } 
        }else {
            dest = "/WEB-INF/Login.jsp?locale=${loc}";
        }
        // dest = "/WEB-INF/commande.jsp";
        RequestDispatcher disp = getServletContext().getRequestDispatcher(dest);
        disp.forward(request, response);
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

    }

//       session.setAttribute("size", clients.size());
//if(LoginService.authentifierClient(email, pwd)){
//    dest = "/WEB-INF/facture.jsp?locale=${loc}";
//}
//else{
//       dest = "/WEB-INF/error.jsp?locale=${loc}";
//}
//        if () {
//           // name =LoginService.getNomClientByEmail(email);
//           // Client user = LoginService.getClientByEmailClient(email);
//            
//        } else {
//            //request.setAttribute("errorMessage", "Bad identity");
//           // dest = "/WEB-INF/Login.jsp?locale=${loc}&&login=${login}";
//           
//        }
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
