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
import tinlt.SHAcode.SHA_Code;
import tinlt.daos.AnswerDAO;
import tinlt.daos.QuestionDAO;
import tinlt.daos.SubjectDAO;
import tinlt.daos.UserDAO;
import tinlt.dtos.AnswerDTO;
import tinlt.dtos.QuestionDTO;
import tinlt.dtos.SubjectDTO;
import tinlt.dtos.UserDTO;
import tinlt.dtos.UserErrorDTO;

/**
 *
 * @author Ray Khum
 */
public class LoginController extends HttpServlet {

    public static final String ERROR = "login.jsp";
    public static final String STUDENT = "home.jsp";
    public static final String TEACHER = "teacher.jsp";

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
            UserErrorDTO error = new UserErrorDTO();
            HttpSession session = request.getSession();
            List<SubjectDTO> listS = new ArrayList<>();
            List<QuestionDTO> listQ = new ArrayList<>();
            List<AnswerDTO> listA = new ArrayList<>();
            Map<QuestionDTO, List<AnswerDTO>> map = null;

            UserDAO daoU = new UserDAO();
            SubjectDAO daoS = new SubjectDAO();
            QuestionDAO daoQ = new QuestionDAO();
            AnswerDAO daoA = new AnswerDAO();

            listS = daoS.GetListSubject();
            listQ = daoQ.GetQuestion("SJ001", "true", "", 0);
            for (QuestionDTO ques : listQ) {
                listA = daoA.GetAnswer(ques.getQuesID());
                if (map == null) {
                    map = new HashMap<>();
                }
                map.put(ques, listA);
            }
            TreeMap<QuestionDTO, List<AnswerDTO>> tree = new TreeMap<>(map);

            String txtEmail = request.getParameter("txtEmail");
            String txtPassword = request.getParameter("txtPassword");
            SHA_Code sha = new SHA_Code();
            byte[] getSHA = sha.getSHA(txtPassword);
            String hexSHA = sha.toHexString(getSHA);

            int pageSize = 20;
            int numOfPro = daoQ.CountQuesBySubID("SJ001","true","");
            int endPage = 0;
            endPage = numOfPro / pageSize;
            if (numOfPro % pageSize != 0) {
                endPage++;
            }

            boolean check = true;
            if (txtEmail.isEmpty()) {
                check = false;
                error.setEmailError("email is empty");
            }
            if (txtPassword.isEmpty()) {
                check = false;
                error.setPasswordError("password is empty");
            }
            if (check) {
                UserDTO user = daoU.CheckLogin(txtEmail, hexSHA);
                if (user != null) {
                    if (user.getRoleID() == 1) {
                        url = STUDENT;
                    } else {
                        url = TEACHER;
                    }
                    session.setAttribute("USER", user);
                    session.setAttribute("EMAIL", user.getEmail());
                    session.setAttribute("ROLE", new UserDAO().getRole(user.getRoleID()));
                    session.setAttribute("SUB", listS);
                    session.setAttribute("MAP", tree);
                    session.setAttribute("PAGE", endPage);
                } else {
                    request.setAttribute("SAI", "email or password incorrect");
                }
            } else {
                request.setAttribute("ERROR", error);
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
