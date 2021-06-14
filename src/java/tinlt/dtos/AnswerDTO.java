/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tinlt.dtos;

import java.io.Serializable;

/**
 *
 * @author Ray Khum
 */
public class AnswerDTO implements Serializable{
    int ansID;
    String ansContent;
    boolean ansCorrect;
    int quesID;
    boolean status;

    public AnswerDTO() {
    }

    public AnswerDTO(int ansID, String ansContent, boolean ansCorrect, int quesID, boolean status) {
        this.ansID = ansID;
        this.ansContent = ansContent;
        this.ansCorrect = ansCorrect;
        this.quesID = quesID;
        this.status = status;
    }

    public int getAnsID() {
        return ansID;
    }

    public void setAnsID(int ansID) {
        this.ansID = ansID;
    }

    public String getAnsContent() {
        return ansContent;
    }

    public void setAnsContent(String ansContent) {
        this.ansContent = ansContent;
    }

    public boolean isAnsCorrect() {
        return ansCorrect;
    }

    public void setAnsCorrect(boolean ansCorrect) {
        this.ansCorrect = ansCorrect;
    }

    public int getQuesID() {
        return quesID;
    }

    public void setQuesID(int quesID) {
        this.quesID = quesID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
    
}
