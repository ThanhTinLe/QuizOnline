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
public class QuestionDTO implements Serializable, Comparable<QuestionDTO>{
    int quesID;
    String quesContent;
    String createDate;
    String subID;
    boolean status;

    public QuestionDTO() {
    }

    public QuestionDTO(int quesID, String quesContent, String createDate, String subID, boolean status) {
        this.quesID = quesID;
        this.quesContent = quesContent;
        this.createDate = createDate;
        this.subID = subID;
        this.status = status;
    }

    public int getQuesID() {
        return quesID;
    }

    public void setQuesID(int quesID) {
        this.quesID = quesID;
    }

    public String getQuesContent() {
        return quesContent;
    }

    public void setQuesContent(String quesContent) {
        this.quesContent = quesContent;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "QuestionDTO{" + "quesID=" + quesID + ", quesContent=" + quesContent + ", createDate=" + createDate + ", subID=" + subID + ", status=" + status + '}';
    }

    @Override
    public int compareTo(QuestionDTO o) {
        return this.quesContent.compareTo(o.getQuesContent());
    }
    
    
    
}
