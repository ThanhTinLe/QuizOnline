package tinlt.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import tinlt.dtos.SubjectDTO;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Ray Khum
 */
public class SubjectDAO {

    public List<SubjectDTO> GetListSubject() throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        List<SubjectDTO> list = null;
        SubjectDTO sub = null;

        try {
            cn = tinlt.utils.DBUtils.getConnection();
            if (cn != null) {
                String sql = "SELECT [subId],[subName],[numQues],[numTime],[status]\n"
                        + "FROM [dbo].[subject]";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String subID = rs.getString("subId");
                    String subName = rs.getString("subName");
                    int numQues = rs.getInt("numQues");
                    int Time = rs.getInt("numTime");
                    boolean status = rs.getBoolean("status");
                    sub = new SubjectDTO(subID, subName, numQues, Time, status);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(sub);
                }
            }
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
