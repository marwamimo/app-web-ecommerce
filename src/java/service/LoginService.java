/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.Client;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Marwa
 */
public class LoginService {
       public  List findListClient() {
        final SessionFactory sessionF = HibernateUtil.getSessionFactory();
        final Session session = sessionF.openSession();
        session.beginTransaction();
        Query query = session.createQuery("select * from Client ");
        List<Client> results = query.list();
        session.getTransaction().commit();
        session.close();
        sessionF.close();
        return results;
    }
//        public List<Client> getListOfUsers(){
//        List<Client> list = new ArrayList<Client>();
//        Session session = HibernateUtil.openSession();
//        Transaction tx = null;        
//        try {
//            tx = session.getTransaction();
//            tx.begin();
//            list = session.createQuery("from Client").list();                        
//            tx.commit();
//        } catch (Exception e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return list;
//    }

//public static Client findClient(String email,String password) {
//    Client client = null;
//    try {
//        Class.forName("oracle.jdbc.OracleDriver");
//    } catch (ClassNotFoundException ex) {
//        Logger.getLogger(LoginService.class.getName()).log(Level.SEVERE, null, ex);
//    }
//    try ( Connection con = DriverManager.getConnection("jdbc:oracle:thin:@144.217.163.57:1521:XE", "Marwa", "anypw") ){
//
//        	String strSql = "SELECT * FROM CLIENT WHERE EMAILCLIENT = ? and MOTDEPASSE = ?";
//			try ( PreparedStatement statement  = con.prepareStatement( strSql ) ) {
//				statement.setString( 1,email.toUpperCase() );
//				statement.setString( 2, password );
//				try ( ResultSet resultSet = statement.executeQuery() ) {
//					if ( resultSet.next() ) {
//						client =new Client(
//								resultSet.getInt( "noclient" ),
//								resultSet.getString( "nomclient" ),
//								resultSet.getString( "motdepasse" ),
//								resultSet.getString( "emailclient" )
//						);
//					} 
//                                        else {
//                                            client=null;
//                                        }
//
//                                            
//				}
//			}
//    } catch (SQLException ex) {
//        Logger.getLogger(LoginService.class.getName()).log(Level.SEVERE, null, ex);
//    }  finally{
//          return client;
//        
// } 
//} 
  


    public static boolean authentifierClient(String email, String password) {
        Client user = getClientByLogin(email,password);
        if (user !=null && user.getEmailclient().equals(email)&& user.getMotdepasse().equals(password)) {
            return true;
        } else {
            return false;
        }
    }

//    public static String getNomClientByEmail(String email) {
//        Client user = getClientByEmailClient(email);
//        return user.getNomclient();
//    }

    public static Client getClientByLogin(String email,String password) {
        final SessionFactory sessionF = HibernateUtil.getSessionFactory();
        final Session session = sessionF.openSession();
        Client user;
        session.beginTransaction();
       // nomClient = nomClient.toUpperCase();
        Query query = session.createQuery("from Client where emailclient = ' " + email + " ' and motdepasse = ' " + password + " '");
        user = (Client) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        sessionF.close();
        return user;
}
//        Session session =  HibernateUtil.getSessionFactory().openSession();
//        Transaction tx = null;
//        Client user = null;
//        try {
//            tx = session.getTransaction();
//            tx.begin();
//            Query query = session.createQuery("from Client where nomclient='"+nomClient+"'");
//            user = (Client)query.uniqueResult();
//            tx.commit();
//        } catch (Exception e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return user;
//    }
//
// }

//        Session session = HibernateUtil.openSession();
//        Transaction tx = null;
//        Client user = null;
//        try {
//            tx = session.getTransaction();
//            tx.begin();
//            Query query = session.createQuery("from User where userId='"+userId+"'");
//            user = (Client)query.uniqueResult();
//            tx.commit();
//        } catch (Exception e) {
//            if (tx != null) {
//                tx.rollback();
//            }
//            e.printStackTrace();
//        } finally {
//            session.close();
//        }
//        return user;
//   }


}
