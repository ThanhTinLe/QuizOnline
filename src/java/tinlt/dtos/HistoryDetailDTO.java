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
public class HistoryDetailDTO {

    int hisID;
    int quesID;
    int correctAns;
    int userAns;

    public HistoryDetailDTO() {
    }

    public HistoryDetailDTO(int hisID, int quesID, int correctAns, int userAns) {
        this.hisID = hisID;
        this.quesID = quesID;
        this.correctAns = correctAns;
        this.userAns = userAns;
    }

    public int getHisID() {
        return hisID;
    }

    public void setHisID(int hisID) {
        this.hisID = hisID;
    }

    public int getQuesID() {
        return quesID;
    }

    public void setQuesID(int quesID) {
        this.quesID = quesID;
    }

    public int getCorrectAns() {
        return correctAns;
    }

    public void setCorrectAns(int correctAns) {
        this.correctAns = correctAns;
    }

    public int getUserAns() {
        return userAns;
    }

    public void setUserAns(int userAns) {
        this.userAns = userAns;
    }

}
