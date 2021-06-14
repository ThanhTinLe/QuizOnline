/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.daos;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import tinlt.dtos.HistoryDetailDTO;

/**
 *
 * @author Ray Khum
 */
public class QuizDAO {

    public boolean CreateHistory(float score, String subID, String email) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        boolean check = false;
        Date date = new Date();
        SimpleDateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
        String ngay = Format.format(date);
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "INSERT INTO [dbo].[tblHistory]([score],[createDate],[subID],[email])\n"
                        + "VALUES(?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setFloat(1, score);
                pst.setString(2, ngay);
                pst.setString(3, subID);
                pst.setString(4, email);
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

    public int hisID() throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int hisID = 0;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT MAX([hisID]) AS hisID\n"
                        + "FROM [dbo].[tblHistory]";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs.next()) {
                    hisID = rs.getInt("hisID");
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
        return hisID;
    }

    public boolean CreateHistoryDetail(int hisID, int quesID, int correctAnsID, int userAnsID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        boolean check = false;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "INSERT INTO [dbo].[tblHistoryDetail]([hisID], [quesID], [correctAns], [userAns])\n"
                        + "VALUES(?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, hisID);
                pst.setInt(2, quesID);
                pst.setInt(3, correctAnsID);
                pst.setInt(4, userAnsID);
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

    public boolean UpdateHisDetail(String userAns, int hisID, int quesID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        boolean check = false;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[tblHistoryDetail]\n"
                        + "SET [userAns] = ?\n"
                        + "WHERE [hisID] = ? AND quesID = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, userAns);
                pst.setInt(2, hisID);
                pst.setInt(3, quesID);
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

    public HistoryDetailDTO GetHisDetail(int hisID, int quesID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        HistoryDetailDTO dto = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [hisID], [quesID], [correctAns], [userAns]\n"
                        + "FROM [dbo].[tblHistoryDetail]\n"
                        + "WHERE [hisID] = ? AND quesID = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, hisID);
                pst.setInt(2, quesID);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int his = rs.getInt("hisID");
                    int ques = rs.getInt("quesID");
                    int correctAns = rs.getInt("correctAns");
                    int userAns = rs.getInt("userAns");
                    dto = new HistoryDetailDTO(his, ques, correctAns, userAns);
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

    public int correctAns(int hisID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int cout = 0;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT COUNT([correctAns]) AS correct\n"
                        + "FROM [dbo].[tblHistoryDetail]\n"
                        + "WHERE [correctAns] = [userAns] AND [hisID] = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, hisID);
                rs = pst.executeQuery();
                if (rs.next()) {
                    cout = rs.getInt("correct");
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
        return cout;
    }

    public boolean UpdateSocre(float socre, int hisID) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        boolean check = false;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "UPDATE [dbo].[tblHistory]\n"
                        + "SET [score] = ?\n"
                        + "WHERE [hisID] = ?";
                pst = cn.prepareStatement(sql);
                pst.setFloat(1, socre);
                pst.setInt(2, hisID);
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
}
