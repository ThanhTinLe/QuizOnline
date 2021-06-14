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
import tinlt.SHAcode.SHA_Code;
import tinlt.daos.UserDAO;
import tinlt.dtos.UserDTO;
import tinlt.dtos.UserErrorDTO;

/**
 *
 * @author Ray Khum
 */
public class CreateController extends HttpServlet {

    public static final String ERROR = "create.jsp";
    public static final String SUCCESS = "login.jsp";

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
            UserDAO dao = new UserDAO();
            SHA_Code sha = new SHA_Code();
            byte[] getSHA = null;
            String hexSHA = null;

            String email = request.getParameter("txtEmail");
            String fullName = request.getParameter("txtFullName");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");

            boolean check = true;
            if (email.isEmpty()) {
                check = false;
                error.setEmailError("email is empty");
            }
            if (dao.CheckEmail(email)) {
                check = false;
                error.setEmailError("email is exit");
            }
            if (fullName.isEmpty()) {
                check = false;
                error.setFullNameError("fullname is empty");
            }
            if (password.isEmpty()) {
                check = false;
                error.setPasswordError("password is empty");
            }
            if (confirm.isEmpty()) {
                check = false;
                error.setConfirmError("confirm is empty");
            }
            if (!confirm.equals(password)) {
                check = false;
                error.setConfirmError("2 password is not same");
            }
            if (check) {
                getSHA = sha.getSHA(password);
                hexSHA = sha.toHexString(getSHA);
                UserDTO user = new UserDTO(email, fullName, hexSHA, "new", 1);
                if (dao.createUser(user)) {
                    url = SUCCESS;
                    request.setAttribute("EMAIL", email);
                    request.setAttribute("CREATE_ACC", "Created");
                }
            } else {
                url = ERROR;
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
