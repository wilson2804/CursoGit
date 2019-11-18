/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author wbolivarc
 */
public class Conexion {

    public Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/sorteoqa?serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false";
        String user = "Wilson";
        String pass = "Macmiller1309";
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("Conectado");
        } catch (Exception e) {
            System.out.println("Error conexion: " + e.getMessage());
        }
        return con;
    }
}









