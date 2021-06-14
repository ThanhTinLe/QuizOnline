/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tinlt.daos.AnswerDAO;
import tinlt.daos.QuestionDAO;

/**
 *
 * @author Ray Khum
 */
public class UpdateQuesController extends HttpServlet {

    public static final String ERROR = "updateQues.jsp";
    public static final String SUCCESS = "UpdateController";

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
            String subID = request.getParameter("txtSubID");
            String quesID = request.getParameter("txtquesID");
            String Ques = request.getParameter("txtQues");
            String ansID1 = request.getParameter("txtAnsID1");
            String ansID2 = request.getParameter("txtAnsID2");
            String ansID3 = request.getParameter("txtAnsID3");
            String ansID4 = request.getParameter("txtAnsID4");
            String ans1 = request.getParameter("txtAns1");
            String ans2 = request.getParameter("txtAns2");
            String ans3 = request.getParameter("txtAns3");
            String ans4 = request.getParameter("txtAns4");
            String radio = request.getParameter("creat");
            String status = request.getParameter("txtCheckBox");
            boolean stat;

            QuestionDAO daoQ = new QuestionDAO();
            AnswerDAO daoA = new AnswerDAO();

            if (status == null) {
                stat = false;
            } else {
                stat = true;
            }
            boolean check = true;

            if (Ques.isEmpty()) {
                check = false;
            }
            if (ans1.isEmpty()) {
                check = false;
            }
            if (ans2.isEmpty()) {
                check = false;
            }
            if (ans3.isEmpty()) {
                check = false;
            }
            if (ans4.isEmpty()) {
                check = false;
            }
            if (radio == null) {
                check = false;
            }
            if (check) {
                if (daoQ.UpdateQues(subID, Ques, stat, quesID)) {
                    if (radio.equals("ans1")) {
                        daoA.UpdateAns(ans1, true, ansID1);
                        daoA.UpdateAns(ans2, false, ansID2);
                        daoA.UpdateAns(ans3, false, ansID3);
                        daoA.UpdateAns(ans4, false, ansID4);

                        url = SUCCESS;
                        request.setAttribute("UPDATED", "updated");
                        request.setAttribute("quesID", quesID);
                    } else if (radio.equals("ans2")) {
                        daoA.UpdateAns(ans1, false, ansID1);
                        daoA.UpdateAns(ans2, true, ansID2);
                        daoA.UpdateAns(ans3, false, ansID3);
                        daoA.UpdateAns(ans4, false, ansID4);

                        url = SUCCESS;
                        request.setAttribute("UPDATED", "updated");
                        request.setAttribute("quesID", quesID);
                    } else if (radio.equals("ans3")) {
                        daoA.UpdateAns(ans1, false, ansID1);
                        daoA.UpdateAns(ans2, false, ansID2);
                        daoA.UpdateAns(ans3, true, ansID3);
                        daoA.UpdateAns(ans4, false, ansID4);

                        url = SUCCESS;
                        request.setAttribute("UPDATED", "updated");
                        request.setAttribute("quesID", quesID);
                    } else if (radio.equals("ans4")) {
                        daoA.UpdateAns(ans1, false, ansID1);
                        daoA.UpdateAns(ans2, false, ansID2);
                        daoA.UpdateAns(ans3, false, ansID3);
                        daoA.UpdateAns(ans4, true, ansID4);

                        url = SUCCESS;
                        request.setAttribute("UPDATED", "updated");
                        request.setAttribute("quesID", quesID);
                    }
                }
            } else {
                url = ERROR;
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
