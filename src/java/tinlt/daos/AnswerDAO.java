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
import java.util.ArrayList;
import java.util.List;
import tinlt.dtos.AnswerDTO;

/**
 *
 * @author Ray Khum
 */
public class AnswerDAO {

    public List<AnswerDTO> GetAnswer(int quesId) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<AnswerDTO> list = null;
        AnswerDTO ans = null;

        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [ansId],[ansContent],[ansCorrect],[quesId],[status]\n"
                        + "FROM [dbo].[answer]"
                        + "WHERE quesId = ? ";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, quesId);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int ansID = rs.getInt("ansId");
                    String ansContent = rs.getString("ansContent");
                    boolean ansCorrect = rs.getBoolean("ansCorrect");
                    int quesID = rs.getInt("quesId");
                    boolean statu = rs.getBoolean("status");
                    ans = new AnswerDTO(ansID, ansContent, ansCorrect, quesID, statu);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(ans);
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
        return list;
    }

    public boolean createAns(String ansContent, int quesID, boolean correct) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "INSERT INTO [dbo].[answer]\n"
                        + "VALUES(?,?,?,1)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, ansContent);
                pst.setBoolean(2, correct);
                pst.setInt(3, quesID);
                if (pst.executeUpdate() == 1) {
                    check = true;
                }
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

    public boolean UpdateAns(String AnsConten, boolean correct, String ansID) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[answer]\n"
                        + "SET [ansContent] = ?, [ansCorrect] = ?\n"
                        + "WHERE [ansId] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, AnsConten);
                pst.setBoolean(2, correct);
                pst.setString(3, ansID);
                if (pst.executeUpdate() == 1) {
                    check = true;
                }
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

    public int GetCorrectAnsID(int quesID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int correctID = 0;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [ansId] AS ansID\n"
                        + "FROM [dbo].[answer]\n"
                        + "WHERE [quesId] = ? AND [ansCorrect] = 1";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, quesID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    correctID = rs.getInt("ansID");
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
        return correctID;
    }
}
