/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
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
public class SearchController extends HttpServlet {

    public static final String SUCCESS = "teacher.jsp";
    public static final String ERROR = "";

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
            HttpSession session = request.getSession();

            String subID = request.getParameter("txtSubID");
            String status = request.getParameter("txtStatus");
            String txtSearch = request.getParameter("txtSearch");
            String indexPage = request.getParameter("txtPage");

            if (subID == null || subID.isEmpty()) {
                if (session.getAttribute("SUBID") == null) {
                    subID = "SJ001";
                } else {
                    subID = (String) session.getAttribute("SUBID");
                }
            }
            if (status == null) {
                status = "true";
            } else if (status.equals("Active")) {
                status = "true";
            } else {
                status = "false";
            }
            if (txtSearch == null) {
                txtSearch = "";
            }
            List<QuestionDTO> listQ = new ArrayList<>();
            List<AnswerDTO> listA = new ArrayList<>();
            Map<QuestionDTO, List<AnswerDTO>> map = null;
            TreeMap<QuestionDTO, List<AnswerDTO>> tree = null;

            int index = 0;
            if (indexPage == null) {
                index = 0;
            } else {
                index = Integer.parseInt(indexPage) - 1;
            }

            int pageSize = 20;
            int numOfPro = new QuestionDAO().CountQuesBySubID(subID, status, txtSearch);
            int endPage = 0;
            endPage = numOfPro / pageSize;
            if (numOfPro % pageSize != 0) {
                endPage++;
            }

            listQ = new QuestionDAO().GetQuestion(subID, status, txtSearch, index);
            if (listQ != null) {
                for (QuestionDTO questionDTO : listQ) {
                    listA = new AnswerDAO().GetAnswer(questionDTO.getQuesID());
                    if (map == null) {
                        map = new HashMap<>();
                    }
                    map.put(questionDTO, listA);
                }
                tree = new TreeMap<>(map);
            } else {
                tree = null;
            }

            session.setAttribute("MAP", tree);
            session.setAttribute("PAGE", endPage);
            session.setAttribute("SUBID", subID);
            session.setAttribute(("INDEX"), index);
            session.setAttribute("STATUS", status);
            url = SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
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
