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
public class QuizTakeDTO {

    int takeQuizID;
    int quizID;
    int questionID;
    int ansTemp;
    int ansFinal;
    int ansRight;

    public QuizTakeDTO() {
    }

    public QuizTakeDTO(int takeQuizID, int quizID, int questionID, int ansTemp, int ansFinal, int ansRight) {
        this.takeQuizID = takeQuizID;
        this.quizID = quizID;
        this.questionID = questionID;
        this.ansTemp = ansTemp;
        this.ansFinal = ansFinal;
        this.ansRight = ansRight;
    }

    public int getTakeQuizID() {
        return takeQuizID;
    }

    public void setTakeQuizID(int takeQuizID) {
        this.takeQuizID = takeQuizID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getAnsTemp() {
        return ansTemp;
    }

    public void setAnsTemp(int ansTemp) {
        this.ansTemp = ansTemp;
    }

    public int getAnsFinal() {
        return ansFinal;
    }

    public void setAnsFinal(int ansFinal) {
        this.ansFinal = ansFinal;
    }

    public int getAnsRight() {
        return ansRight;
    }

    public void setAnsRight(int ansRight) {
        this.ansRight = ansRight;
    }

}
