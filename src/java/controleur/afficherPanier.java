/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleur;

import dao.Article;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.PanierService;

/**
 *
 * @author Marwa
 */
public class afficherPanier extends HttpServlet {

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
        String dest="";
       // String loc = request.getParameter("locale");
        double prix = 0.0, total = 0.0;
        double taxe = 0.15;
        HttpSession session = request.getSession();
        //session.setAttribute("locale", loc);
        Set<String> articleCommandes = (Set<String>) session.getAttribute("articleCommandes");
        List<Article> articles = (List<Article>) session.getAttribute("articles");
        ArrayList<Article> listeArticle = new ArrayList<Article>();
       // if(articleCommandes == null){
//            dest = "/index.jsp?action=afficherArticle";
//        }
//        else
        if(articleCommandes!=null){
        for (int i = 0; i < articles.size(); i++) {
            for (String s : articleCommandes) {
                if (articles.get(i).getNoarticle() == Integer.parseInt(s)) {
                    listeArticle.add(articles.get(i));
                    prix = prix + articles.get(i).getPrixunitaire().doubleValue();

                }
            }
        } }
        DecimalFormat f = new DecimalFormat();
        f.setMaximumFractionDigits(2);
        taxe = taxe * prix;
        total = prix + taxe;
        session.setAttribute("prix", prix);
        session.setAttribute("taxe", f.format(taxe));
        session.setAttribute("total", f.format(total));
        session.setAttribute("listeArticle", listeArticle);
        dest = "/WEB-INF/panier.jsp";
 
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
