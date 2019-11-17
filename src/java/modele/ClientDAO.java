/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modele;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Marwa
 */
public class ClientDAO {

    public ClientDAO(int aInt, String string, String string1, String string2) {
    }

    public static ClientDAO isValidLogin(String name, String pwd) {
        Properties prop = new Properties();
        try (FileInputStream file = new FileInputStream("confDB.properties")) {
            prop.load(file);

        } catch (IOException ex) {
            Logger.getLogger(ClientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            Class.forName(prop.getProperty("jdbc.driver.class"));

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClientDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        String url = prop.getProperty("jdbc.url");
        String login = prop.getProperty("jdbc.login");
        String password = prop.getProperty("jdbc.password");

        try (Connection connection = DriverManager.getConnection(url, login, password)) {
            String strSql = "SELECT * FROM CLIENT WHERE emailclient=? AND motdepasse=?";
            try (PreparedStatement statement = connection.prepareStatement(strSql)) {
                statement.setString(1, name);
                statement.setString(2, pwd);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        return new ClientDAO(
                                resultSet.getInt("noclient"),
                                resultSet.getString("nomclient"),
                                resultSet.getString("motdepasse"),
                                resultSet.getString("emailclient")
                        );
                    } else 
                    {
                        return null;
                    }
                }
            }
        } catch (Exception exception) {
            throw new RuntimeException(exception);
        }

    }
}
