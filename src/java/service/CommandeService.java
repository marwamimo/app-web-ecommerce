/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.Client;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

/**
 *
 * @author Marwa
 */
public class CommandeService {
    public static long maxId() {
       SessionFactory sessionF = HibernateUtil.getSessionFactory();
       Session session = sessionF.openSession();
       session.beginTransaction();
       long id;
       Query query = session.createQuery("SELECT MAX(nocommande)  FROM commande");
        id= (long) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        sessionF.close();
        return id;
       
    }    
    public static void addCommande(){
        SessionFactory sessionF = HibernateUtil.getSessionFactory();
        Session session = sessionF.openSession();
        session.beginTransaction();
       // Commande cmd = new Commande()
    }
            

        ////insert
        //Regions myRegion = new Regions (new BigDecimal(15),"Marwa",null);
        //session.save(myRegion);
}
