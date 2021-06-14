/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tinlt.daos.AnswerDAO;
import tinlt.daos.QuestionDAO;
import tinlt.dtos.AnswerDTO;
import tinlt.dtos.QuestionDTO;

/**
 *
 * @author Ray Khum
 */
public class UpdateController extends HttpServlet {

    public static final String ERROR = "";
    public static final String SUCCESS = "updateQues.jsp";
    public static final String SEARCH = "SearchController";

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
        String url = ERROR;
        try {
            String quesID = request.getParameter("txtUpdate");
            if (quesID == null) {
                quesID = (String) request.getAttribute("quesID");
            }
            QuestionDTO dto = new QuestionDAO().GetQuestionByID(Integer.parseInt(quesID));
            List<AnswerDTO> listA = new ArrayList<>();
            listA = new AnswerDAO().GetAnswer(Integer.parseInt(quesID));
            HttpSession session = request.getSession();
            session.setAttribute("ANSWER1", listA.get(0));
            session.setAttribute("ANSWER2", listA.get(1));
            session.setAttribute("ANSWER3", listA.get(2));
            session.setAttribute("ANSWER4", listA.get(3));
            session.setAttribute("QUES", dto);
            if (request.getParameter("txtUpdate") == null) {
                url = SEARCH;
            } else {
                url = SUCCESS;
            }

        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
