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
public class UserDTO implements Serializable {

    String email;
    String fullName;
    String password;
    String status;
    int roleID;

    public UserDTO() {
    }

    public UserDTO(String email, String fullName, String password, String status, int roleID) {
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.status = status;
        this.roleID = roleID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "email=" + email + ", fullName=" + fullName + ", password=" + password + ", status=" + status + ", roleID=" + roleID + '}';
    }

}
