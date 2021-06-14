/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.dtos;

/**
 *
 * @author Ray Khum
 */
public class HistoryDTO {

    int hisID;
    float score;
    String createDate;
    String subID;
    String email;

    public HistoryDTO() {
    }

    public HistoryDTO(int hisID, float score, String createDate, String subID, String email) {
        this.hisID = hisID;
        this.score = score;
        this.createDate = createDate;
        this.subID = subID;
        this.email = email;
    }

    public int getHisID() {
        return hisID;
    }

    public void setHisID(int hisID) {
        this.hisID = hisID;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getSubID() {
        return subID;
    }

    public void setSubID(String subID) {
        this.subID = subID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
