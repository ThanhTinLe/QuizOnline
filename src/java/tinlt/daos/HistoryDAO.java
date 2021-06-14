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
import tinlt.dtos.HistoryDTO;
import tinlt.dtos.HistoryDetailDTO;

/**
 *
 * @author Ray Khum
 */
public class HistoryDAO {

    public List<HistoryDTO> GetListHisBySubID(String subID, String mail) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<HistoryDTO> list = null;
        HistoryDTO dto = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [hisID],[score],[createDate],[subID],[email]\n"
                        + "FROM [dbo].[tblHistory]\n"
                        + "WHERE subID = ? AND email = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, subID);
                pst.setString(2, mail);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int hisID = rs.getInt("hisID");
                    float score = rs.getFloat("score");
                    String createDate = rs.getString("createDate");
                    String sub = rs.getString("subID");
                    String email = rs.getString("email");
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    dto = new HistoryDTO(hisID, score, createDate, sub, email);
                    list.add(dto);
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

    public List<HistoryDetailDTO> GetListHisDetail(int hisID, int index) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<HistoryDetailDTO> list = null;
        HistoryDetailDTO dto = null;
        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [hisID],[quesID],[correctAns],[userAns]\n"
                        + "FROM [dbo].[tblHistoryDetail]\n"
                        + "WHERE [hisID] = ?\n"
                        + "ORDER BY [quesID] ASC\n"
                        + "OFFSET 5*? ROWS\n"
                        + "FETCH NEXT 5 ROWS ONLY";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, hisID);
                pst.setInt(2, index);
                rs = pst.executeQuery();
                while (rs.next()) {
                    int his = rs.getInt("hisID");
                    int quesID = rs.getInt("quesID");
                    int correctAns = rs.getInt("correctAns");
                    int userAns = rs.getInt("userAns");
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    dto = new HistoryDetailDTO(his, quesID, correctAns, userAns);
                    list.add(dto);
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
