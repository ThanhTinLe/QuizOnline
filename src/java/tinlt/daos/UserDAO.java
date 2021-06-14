/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import tinlt.dtos.UserDTO;

/**
 *
 * @author Ray Khum
 */
public class UserDAO {

    public UserDTO CheckLogin(String email, String password) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        UserDTO dto = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [email], [fullname], [password], [status], [roleID]\n"
                        + "FROM [dbo].[tblUsers]\n"
                        + "WHERE [email] = ? AND [password] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs.next()) {
                    String mail = rs.getString("email");
                    String fullname = rs.getString("fullname");
                    String pass = rs.getString("password");
                    String status = rs.getString("status");
                    int roleID = rs.getInt("roleID");
                    dto = new UserDTO(mail, fullname, pass, status, roleID);
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return dto;
    }

    public String getRole(int roleID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String role = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [roleName]\n"
                        + "FROM [dbo].[tblRoles]\n"
                        + "WHERE [roleID] = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, roleID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    role = rs.getString("roleName");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return role;
    }

    public boolean createUser(UserDTO user) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "INSERT INTO [dbo].[tblUsers]([email],[fullname],[password],[status],[roleID])\n"
                        + "VALUES (?,?,?,?,1)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, user.getEmail());
                pst.setString(2, user.getFullName());
                pst.setString(3, user.getPassword());
                pst.setString(4, user.getStatus());
                check = pst.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }

    public boolean CheckEmail(String email) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [email]\n"
                        + "FROM [dbo].[tblUsers]\n"
                        + "WHERE [email] = ? ";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                rs = pst.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }
}
