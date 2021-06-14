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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tinlt.daos.AnswerDAO;
import tinlt.daos.HistoryDAO;
import tinlt.daos.QuestionDAO;
import tinlt.daos.SubjectDAO;
import tinlt.dtos.AnswerDTO;
import tinlt.dtos.HistoryDetailDTO;
import tinlt.dtos.QuestionDTO;
import tinlt.dtos.SubjectDTO;

/**
 *
 * @author Ray Khum
 */
public class HisDetailController extends HttpServlet {

    public static final String ERROR = "";
    public static final String SUCCESS = "historyDetail.jsp";

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
            String hisID = request.getParameter("txtHisID");
            HttpSession session = request.getSession();
            String paging = request.getParameter("txtPaging");
            String subID = (String) session.getAttribute("SUBID");
            if (paging == null) {
                paging = "0";
            }
            if (paging.equals("")) {
                paging = "0";
            }
            int numOfQues = 0;
            List<SubjectDTO> listS = new ArrayList<>();
            listS = new SubjectDAO().GetListSubject();
            for (SubjectDTO subjectDTO : listS) {
                if (subjectDTO.getSubID().equals(subID)) {
                    numOfQues = subjectDTO.getNumQues();
                }
            }

            int pageSize = 5;
            int endPage = 0;
            endPage = numOfQues / pageSize;
            if (numOfQues % pageSize != 0) {
                endPage++;
            }

            HistoryDAO dao = new HistoryDAO();
            List<HistoryDetailDTO> list = new ArrayList<>();
            list = dao.GetListHisDetail(Integer.parseInt(hisID), Integer.parseInt(paging));
            for (HistoryDetailDTO historyDetailDTO : list) {
                System.out.println("==>" + historyDetailDTO.getQuesID());
            }

            List<QuestionDTO> listQ = new ArrayList<>();
            List<AnswerDTO> listA = new ArrayList<>();
            QuestionDAO daoQ = new QuestionDAO();
            AnswerDAO daoA = new AnswerDAO();
            Map<QuestionDTO, List<AnswerDTO>> map = null;
            listQ = daoQ.GetFullQuestion(subID);
            for (QuestionDTO ques : listQ) {
                listA = daoA.GetAnswer(ques.getQuesID());
                if (map == null) {
                    map = new HashMap<>();
                }
                map.put(ques, listA);
            }

            session.setAttribute("LIST_HIS_DETAIL", list);
            session.setAttribute("MAP_HIS", map);
            session.setAttribute("END_PAGE", endPage);
            session.setAttribute("HIS_ID", hisID);
            url = SUCCESS;
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
