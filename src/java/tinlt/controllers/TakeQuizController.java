/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tinlt.daos.QuizDAO;
import tinlt.dtos.HistoryDetailDTO;
import tinlt.dtos.QuestionDTO;

/**
 *
 * @author Ray Khum
 */
public class TakeQuizController extends HttpServlet {

    public static final String ERROR = "";
    public static final String SUCCESS = "home.jsp";

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
            List<QuestionDTO> listQ = (List<QuestionDTO>) session.getAttribute("LISTQUES");
            String txtNext = request.getParameter("txtNext");
            int index = (int) session.getAttribute("INDEX");
            String answer = request.getParameter("ans");
            int quesID = Integer.parseInt(request.getParameter("txtQuesID"));
            int hisID = (int) session.getAttribute("HISID");

            if (txtNext.equals("next")) {
                index += 1;
            }
            if (txtNext.equals("previous")) {
                index -= 1;
            }

            QuizDAO dao = new QuizDAO();

            HistoryDetailDTO history = new QuizDAO().GetHisDetail(hisID, listQ.get(index).getQuesID());

            if (dao.UpdateHisDetail(answer, hisID, quesID)) {
                if (history == null) {
                    session.setAttribute("USER_ANS", "");
                } else {
                    session.setAttribute("USER_ANS", history.getUserAns());
                    session.setAttribute("INDEX_QUES", listQ.get(index));
                    session.setAttribute("INDEX", index);
                    url = SUCCESS;
                }
            }
            int numOfTime = (int) session.getAttribute("TIME");
            //            time
            String timeNow = (String) session.getAttribute("BEGINQUIZ");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            if (timeNow == null) {
                timeNow = dateFormat.format(cal.getTime());
                session.setAttribute("BEGINQUIZ", timeNow);
            }

            String timeEnd = (String) session.getAttribute("ENDQUIZ");
            if (timeEnd == null) {
                cal.add(Calendar.MINUTE, numOfTime);
                timeEnd = dateFormat.format(cal.getTime());
                session.setAttribute("ENDQUIZ", timeEnd);
            }
            Date end = dateFormat.parse(timeEnd);
            Date now = new Date();

            long time = end.getTime() - now.getTime();
            long second = (time / 1000 % 60) + 1;
            long min = time / (60 * 1000) % 60;
            long hour = time / (60 * 60 * 1000);

            session.setAttribute("HOUR", hour);
            session.setAttribute("MIN", min);
            session.setAttribute("SECOND", second);

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
