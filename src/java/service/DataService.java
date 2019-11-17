/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.Article;
import dao.Client;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Marwa
 */
public class DataService {

    static Session session = null;

    public static List findListProduct() {
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Article");
        List<Article> results = query.list();
        session.getTransaction().commit();
        session.close();
        return results;
    }
      public static List<Client> findListClient() {
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Client");
        List<Client> results = query.list();
        session.getTransaction().commit();
        session.close();
        return results;
    }

    public static Client getClientByEmail(String email) {
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Client user;
        Query query = session.createQuery("from Client clt where clt.emailclient = :email");
        query.setString("email", email);
        user = (Client) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        return user;
    }
}
