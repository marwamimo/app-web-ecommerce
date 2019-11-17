/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.Article;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import util.HibernateUtil;

/**
 *
 * @author Marwa
 */
public class PanierService {
        public static Article findListProductByNoArticle(Long numero){
          SessionFactory sessionF = HibernateUtil.getSessionFactory();
         Session session = sessionF.openSession();
        Article article;
        session.beginTransaction();
            Query query = session.createQuery("from Article where noarticle = ' "+numero+ " '");
        article = (Article) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        sessionF.close();
        return article;
        
        
    }
}
