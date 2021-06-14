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
import tinlt.dtos.CreateQuesError;

/**
 *
 * @author Ray Khum
 */
public class CreateQuesController extends HttpServlet {

    public static final String ERROR = "";
    public static final String SUCCESS = "createQues.jsp";

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
            String Ques = request.getParameter("txtQues");
            String ans1 = request.getParameter("txtAns1");
            String ans2 = request.getParameter("txtAns2");
            String ans3 = request.getParameter("txtAns3");
            String ans4 = request.getParameter("txtAns4");
            String radio = request.getParameter("creat");

            AnswerDAO daoA = new AnswerDAO();
            QuestionDAO daoQ = new QuestionDAO();
            CreateQuesError error1 = new CreateQuesError();
            boolean check = true;

            if (Ques.isEmpty()) {
                check = false;
                error1.setQuestion("Question is empty");
            }
            if (ans1.isEmpty()) {
                check = false;
                error1.setAns1("Answer 1 is empty");
            }
            if (ans2.isEmpty()) {
                check = false;
                error1.setAns2("Answer 2 is empty");
            }
            if (ans3.isEmpty()) {
                check = false;
                error1.setAns3("Answer 3 is empty");
            }
            if (ans4.isEmpty()) {
                check = false;
                error1.setAns4("Answer 4 is empty");
            }
            if (radio == null || radio.isEmpty()) {
                check = false;
                error1.setChoice("Choice the correct answer");
            }

            if (check) {
                if (daoQ.CreateQues(Ques, subID)) {

                    int quesID = daoQ.MaxID();

                    if (radio.equals("ans1")) {
                        daoA.createAns(ans1, quesID, true);
                        daoA.createAns(ans2, quesID, false);
                        daoA.createAns(ans3, quesID, false);
                        daoA.createAns(ans4, quesID, false);

                        request.setAttribute("CREATED", "questions CREATED ");
                        url = SUCCESS;

                    } else if (radio.equals("ans2")) {
                        daoA.createAns(ans1, quesID, false);
                        daoA.createAns(ans2, quesID, true);
                        daoA.createAns(ans3, quesID, false);
                        daoA.createAns(ans4, quesID, false);

                        request.setAttribute("CREATED", "questions CREATED ");
                        url = SUCCESS;

                    } else if (radio.equals("ans3")) {
                        daoA.createAns(ans1, quesID, false);
                        daoA.createAns(ans2, quesID, false);
                        daoA.createAns(ans3, quesID, true);
                        daoA.createAns(ans4, quesID, false);

                        request.setAttribute("CREATED", "questions CREATED ");
                        url = SUCCESS;

                    } else if (radio.equals("ans4")) {
                        daoA.createAns(ans1, quesID, false);
                        daoA.createAns(ans2, quesID, false);
                        daoA.createAns(ans3, quesID, false);
                        daoA.createAns(ans4, quesID, true);

                        request.setAttribute("CREATED", "questions CREATED ");
                        url = SUCCESS;
                    }
                }
            } else {
                url = SUCCESS;
                request.setAttribute("ERROR1", error1);
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
