/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.sublime.ejb;

import com.sublime.jpa.User;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author USMEM-W-003157
 */
@Stateless
public class UserSessionBean {

    private EntityManager em;
    
    public void RegisterNewUser(String email, String password) {
    
    
           User newUser = new User();
           newUser.setEmail(email);
           newUser.setPassword(password);
           
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("com.sublime_Sublime_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            //em.getTransaction().begin();
            em.persist(newUser);
            //em.getTransaction().commit();
            
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")


}
