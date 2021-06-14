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
public class SubjectDTO implements Serializable {

    String subID;
    String subName;
    int numQues;
    int numTime;
    boolean status;

    public SubjectDTO() {
    }

    public SubjectDTO(String subID, String subName, int numQues, int numTime, boolean status) {
        this.subID = subID;
        this.subName = subName;
        this.numQues = numQues;
        this.numTime = numTime;
        this.status = status;
    }

    public String getSubID() {
        return subID;
    }

    public void setSubID(String subID) {
        this.subID = subID;
    }

    public String getSubName() {
        return subName;
    }

    public void setSubName(String subName) {
        this.subName = subName;
    }

    public int getNumQues() {
        return numQues;
    }

    public void setNumQues(int numQues) {
        this.numQues = numQues;
    }

    public int getNumTime() {
        return numTime;
    }

    public void setNumTime(int numTime) {
        this.numTime = numTime;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "SubjectDTO{" + "subID=" + subID + ", subName=" + subName + ", numQues=" + numQues + ", numTime=" + numTime + ", status=" + status + '}';
    }

}
