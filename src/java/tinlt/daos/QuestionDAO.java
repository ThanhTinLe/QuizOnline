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
import tinlt.dtos.QuestionDTO;

/**
 *
 * @author Ray Khum
 */
public class QuestionDAO {

    public List<QuestionDTO> GetQuestion(String subID, String status, String search, int index) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<QuestionDTO> list = null;
        QuestionDTO ques = null;

        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [quesId],[quesContent],[createDate],[subId],[status]\n "
                        + "FROM [dbo].[question]\n "
                        + "WHERE [subId] = ? AND [status] = ? AND [quesContent] LIKE ?\n "
                        + "ORDER BY [quesId] ASC\n "
                        + "OFFSET 20*? ROWS\n "
                        + "FETCH NEXT 20 ROWS ONLY ";
                pst = cn.prepareStatement(sql);
                pst.setString(1, subID);
                pst.setString(2, status);
                pst.setString(3, "%" + search + "%");
                pst.setInt(4, index);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int quesID = rs.getInt("quesId");
                    String quesContent = rs.getString("quesContent");
                    String createDate = rs.getString("createDate");
                    String sub = rs.getString("subId");
                    boolean statu = rs.getBoolean("status");
                    ques = new QuestionDTO(quesID, quesContent, createDate, sub, statu);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(ques);
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

    public int CountQuesBySubID(String subID, String status, String search) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int count = 0;

        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT COUNT([quesId]) AS [count]\n"
                        + "FROM [dbo].[question]\n"
                        + "WHERE [subId] = ? AND [status] = ? AND [quesContent] LIKE ? ";
                pst = cn.prepareStatement(sql);
                pst.setString(1, subID);
                pst.setString(2, status);
                pst.setString(3, "%" + search + "%");
                rs = pst.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("count");
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
        return count;
    }

    public QuestionDTO GetQuestionByID(int quesID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        QuestionDTO ques = null;

        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [quesId],[quesContent],[createDate],[subId],[status]\n "
                        + "FROM [dbo].[question]\n "
                        + "WHERE quesId = ? ";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, quesID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    int ID = rs.getInt("quesId");
                    String quesContent = rs.getString("quesContent");
                    String createDate = rs.getString("createDate");
                    String sub = rs.getString("subId");
                    boolean statu = rs.getBoolean("status");
                    ques = new QuestionDTO(quesID, quesContent, createDate, sub, statu);
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
        return ques;
    }

    public boolean CreateQues(String quesContent, String subID) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "INSERT INTO [dbo].[question]\n"
                        + "VALUES(?,GETDATE(),?,1)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, quesContent);
                pst.setString(2, subID);
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

    public int MaxID() throws SQLException {
        int ID = 0;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT MAX([quesId]) as ID\n"
                        + "FROM [dbo].[question]";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    ID = rs.getInt("ID");
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
        return ID;
    }

    public boolean DeleteQues(String quesID) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[question]\n"
                        + "SET [status] = 0\n"
                        + "WHERE [quesId] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, quesID);
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

    public boolean UpdateQues(String subID, String Ques, boolean status, String quesID) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[question]\n"
                        + "SET [quesContent] = ?,[status] = ?, [subId] = ?\n"
                        + "WHERE [quesId] = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, Ques);
                pst.setBoolean(2, status);
                pst.setString(3, subID);
                pst.setString(4, quesID);
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

    public List<QuestionDTO> GetQuestionBySubID(String SubID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        QuestionDTO ques = null;
        List<QuestionDTO> list = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [quesId],[quesContent],[createDate],[subId],[status]\n"
                        + "FROM [dbo].[question]\n"
                        + "WHERE  [subId] = ? AND [status] = 1";
                pst = cn.prepareStatement(sql);
                pst.setString(1, SubID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int quesID = rs.getInt("quesId");
                    String quesContent = rs.getString("quesContent");
                    String createDate = rs.getString("createDate");
                    String sub = rs.getString("subId");
                    boolean statu = rs.getBoolean("status");
                    ques = new QuestionDTO(quesID, quesContent, createDate, sub, statu);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(ques);
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

    public List<QuestionDTO> GetFullQuestion(String subID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<QuestionDTO> list = null;
        QuestionDTO ques = null;

        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [quesId],[quesContent],[createDate],[subId],[status]\n "
                        + "FROM [dbo].[question]\n "
                        + "WHERE [subId] = ? \n ";
                pst = cn.prepareStatement(sql);
                pst.setString(1, subID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int quesID = rs.getInt("quesId");
                    String quesContent = rs.getString("quesContent");
                    String createDate = rs.getString("createDate");
                    String sub = rs.getString("subId");
                    boolean statu = rs.getBoolean("status");
                    ques = new QuestionDTO(quesID, quesContent, createDate, sub, statu);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(ques);
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
}
