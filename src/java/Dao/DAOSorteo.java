/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Conexion;
import Modelo.Premio;
import Modelo.Sorteo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author wbolivarc
 */
public class DAOSorteo {

    Conexion con = new Conexion();

    public DAOSorteo() {
        con = new Conexion();
    }

    public int ContadorAgua(int idpremio) {
        int contador = 0;
        String q = "SELECT count(idagua) FROM sorteoqa.agua WHERE idpremio = " + idpremio;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                contador = rs.getInt(1);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return contador;
    }

    public int ContadorGanador(int idpremio) {
        int contador = 0;
        String q = "SELECT count(idganador) FROM sorteoqa.ganador WHERE idpremio = " + idpremio;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                contador = rs.getInt(1);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return contador;
    }

    public Sorteo ObtenerNumero(int numero) {
        Sorteo s = new Sorteo();
        String q = "SELECT * FROM sorteoqa.rifa where numero = " + numero + " order by numero asc";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                s.setId_rifa(rs.getInt(1));
                s.setNumero(rs.getString(2));
                s.setNombre(rs.getString(3));
                s.setTelefono(rs.getString(4));
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return s;
    }

    public void add_Agua(Sorteo s, int premio) {
        PreparedStatement ps = null;
        int estado;
        String q = "INSERT INTO `sorteoqa`.`agua` "
                + "(`idrifa`,`nombre`,`numero`,`idpremio`) "
                + "VALUES(?,?,?,?)";
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement(q);
            ps.setInt(1, s.getId_rifa());
            ps.setString(2, s.getNombre());
            ps.setString(3, s.getNumero());
            ps.setInt(4, premio);
            estado = ps.executeUpdate();

            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }

    public void add_Ganador(Sorteo s, int premio) {
        PreparedStatement ps = null;
        int estado;
        String q = "INSERT INTO `sorteoqa`.`ganador` "
                + "(`idpremio`,`idrifa`,`nombre`,`numero`) "
                + "VALUES "
                + "(?,?,?,?)";
        try {
            Connection acceso = con.getConnection();
            ps = acceso.prepareStatement(q);
            ps.setInt(1, premio);
            ps.setInt(2, s.getId_rifa());
            ps.setString(3, s.getNombre());
            ps.setString(4, s.getNumero());
            estado = ps.executeUpdate();
            if (estado > 0) {
                System.out.println("Inserto correctamente");
            } else {
                System.out.println("Error al insertar");
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error al insertar: " + e.getMessage());
        }
    }

    public Sorteo ObtenerGanador(int premio) {
        Sorteo s = new Sorteo();
        String q = "SELECT g.idrifa,g.nombre,g.numero, r.telefono FROM sorteoqa.ganador g, sorteoqa.rifa r where g.numero = r.numero AND g.idpremio = " + premio;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                s.setId_rifa(rs.getInt(1));
                s.setNombre(rs.getString(2));
                s.setNumero(rs.getString(3));
                s.setTelefono(rs.getString(4));
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return s;
    }

    public ArrayList<Sorteo> ObtenerAguas(int premio) {
        ArrayList listaSorteo = new ArrayList();
        Sorteo s;
        try {
            String sql = "SELECT g.idrifa,g.nombre,g.numero, r.telefono FROM sorteoqa.agua g, sorteoqa.rifa r where g.numero = r.numero AND g.idpremio = " + premio + " order by idagua asc";
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                s = new Sorteo();
                s.setId_rifa(rs.getInt(1));
                s.setNombre(rs.getString(2));
                s.setNumero(rs.getString(3));
                s.setTelefono(rs.getString(4));
                listaSorteo.add(s);
            }
            acceso.close();
        } catch (Exception e) {
            System.out.println("Error Listar: " + e.getMessage());
        }
        return listaSorteo;
    }

    public String ObtienePremio(int premio) {
        String nombrePremio = "";
        String q = "SELECT nombre FROM sorteoqa.premio WHERE idpremio = " + premio;
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                nombrePremio = rs.getString(1);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return nombrePremio;
    }

    public ArrayList<Premio> ObtienePremios() {
        ArrayList listaPremio = new ArrayList();
        Premio p;
        String q = "SELECT * FROM sorteoqa.premio";
        try {
            Connection acceso = con.getConnection();
            PreparedStatement ps = acceso.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                p = new Premio();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                listaPremio.add(p);
            }
            acceso.close();
        } catch (SQLException e) {
            System.out.println("Error Buscar: " + e.getMessage());
        }
        return listaPremio;
    }
    
    
}








