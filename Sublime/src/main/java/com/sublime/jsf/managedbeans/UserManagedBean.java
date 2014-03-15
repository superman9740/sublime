/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sublime.jsf.managedbeans;

import com.sublime.ejb.UserSessionBean;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author sdickson
 */
@ManagedBean
@SessionScoped
public class UserManagedBean {

    private Long rowID;
    private String email;
    
     @EJB
    private UserSessionBean userSessionBean;
     
    /**
     * Creates a new instance of UserMangedBean
     */
    public UserManagedBean() {
    }

    /**
     * @return the rowID
     */
    public Long getRowID() {
        return rowID;
    }

    /**
     * @param rowID the rowID to set
     */
    public void setRowID(Long rowID) {
        this.rowID = rowID;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
}
