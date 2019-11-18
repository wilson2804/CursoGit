/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author wbolivarc
 */
public class Sorteo {
    
    private String numero;
    private int id_rifa;
    private String Nombre;
    private String Telefono;

    public Sorteo(String numero, int id_rifa, String Nombre, String Telefono) {
        this.numero = numero;
        this.id_rifa = id_rifa;
        this.Nombre = Nombre;
        this.Telefono = Telefono;
    }

    public Sorteo() {
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getId_rifa() {
        return id_rifa;
    }

    public void setId_rifa(int id_rifa) {
        this.id_rifa = id_rifa;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }
    
    
    
}







