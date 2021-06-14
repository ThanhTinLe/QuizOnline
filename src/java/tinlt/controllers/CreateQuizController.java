/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tinlt.daos.AnswerDAO;
import tinlt.daos.QuestionDAO;
import tinlt.daos.QuizDAO;
import tinlt.daos.SubjectDAO;
import tinlt.dtos.AnswerDTO;
import tinlt.dtos.QuestionDTO;
import tinlt.dtos.SubjectDTO;

/**
 *
 * @author Ray Khum
 */
public class CreateQuizController extends HttpServlet {

    public static final String ERROR = "home.jsp";
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

            String email = (String) session.getAttribute("EMAIL");
            String subID = request.getParameter("txtSubID");
            int numOfQues = 0;
            int numOfTime = 0;
            List<SubjectDTO> listS = new ArrayList<>();
            listS = new SubjectDAO().GetListSubject();
            for (SubjectDTO subjectDTO : listS) {
                if (subjectDTO.getSubID().equals(subID)) {
                    numOfQues = subjectDTO.getNumQues();
                    numOfTime = subjectDTO.getNumTime();
                }
            }
            QuestionDAO daoQ = new QuestionDAO();
            List<AnswerDTO> listA = new ArrayList<>();
            List<QuestionDTO> listQ = new ArrayList<>();
            listQ = daoQ.GetQuestionBySubID(subID);
            Map<QuestionDTO, List<AnswerDTO>> map = null;
            List<QuestionDTO> listQuizQues = new ArrayList<>();
            Random random = new Random();
            if (listQ == null) {
                request.setAttribute("NOT_ENOUGHT", "the question bank is not enought to create quiz");
            } else if (listQ.size() < numOfQues) {
                request.setAttribute("NOT_ENOUGHT", "the question bank is not enought to create quiz");
            } else {
                QuizDAO dao = new QuizDAO();
                if (dao.CreateHistory(0, subID, email)) {
                    int hisID = dao.hisID();
                    for (int i = 0; i < 100000; i++) {
                        int ran = random.nextInt(listQ.size());
                        listA = new AnswerDAO().GetAnswer(listQ.get(ran).getQuesID());
                        if (map == null) {
                            map = new HashMap<>();
                        }
                        for (AnswerDTO answerDTO : listA) {
                            if (answerDTO.isAnsCorrect() == true) {
                                if (dao.CreateHistoryDetail(hisID, listQ.get(ran).getQuesID(), new AnswerDAO().GetCorrectAnsID(listQ.get(ran).getQuesID()), 0)) {
                                    map.put(listQ.get(ran), listA);
                                    listQuizQues.add(listQ.get(ran));
                                }
                            }
                        }
                        if (map.size() == numOfQues) {
                            break;
                        }
                    }
                    session.setAttribute("HISID", hisID);
                }
                session.setAttribute("LISTQUES", listQuizQues);
                session.setAttribute("INDEX_QUES", listQuizQues.get(0));
                session.setAttribute("INDEX", 0);
                session.setAttribute("QUIZ_MAP", map);
                session.setAttribute("NUM_OF_QUES", numOfQues);
                url = SUCCESS;
            }
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
            session.setAttribute("TIME", numOfTime);
            session.setAttribute("SUBID", subID);
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
