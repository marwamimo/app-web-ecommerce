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
public class ProductService {

    public static List findListProduct() {
        final SessionFactory sessionF = HibernateUtil.getSessionFactory();
        final Session session = sessionF.openSession();
        session.beginTransaction();
        Query query = session.createQuery("from Article");
        List<Article> results = query.list();
        session.getTransaction().commit();
        session.close();
        sessionF.close();
        return results;
    }
public static void modifyProduct(long noarticle){
     final SessionFactory sessionF = HibernateUtil.getSessionFactory();
        final Session session = sessionF.openSession();
        session.beginTransaction();
        Article article;
       Query query = session.createQuery("from Article where noarticle = ' "+ noarticle +" ' ");
       article = (Article) query.uniqueResult();
       short qtt= article.getQuantiteenstock();
       qtt=qtt--;
       article.setQuantiteenstock(qtt);
       session.update(article);
}

}
