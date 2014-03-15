/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sublime.jsf.managedbeans;

import com.sublime.ejb.UserSessionBean;
import com.sublime.jpa.User;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

/**
 *
 * @author sdickson
 */
@ManagedBean(name="manageUserBean")
@SessionScoped
public class ManageUserBean {
    
    private List<UserManagedBean> users;
    
     @EJB
    private UserSessionBean userSessionBean;
     
    /**
     * Creates a new instance of ManageUserBean
     */
    public ManageUserBean() {
        
        
         this.users = new ArrayList<UserManagedBean>();
         List<User> usersList = userSessionBean.getAllUsers();
         
         for(User userObj : usersList)
         {
             UserManagedBean beanObj = new UserManagedBean();
              beanObj.setRowID(userObj.getRowid());
              beanObj.setEmail(userObj.getEmail());
              users.add(beanObj);
              
              
         }
        
       
    
    
       
    }

    /**
     * @return the users
     */
    public List<UserManagedBean> getUsers() {
        return users;
    }

    /**
     * @param users the users to set
     */
    public void setUsers(List<UserManagedBean> users) {
        this.users = users;
    }
    
}
