/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete.DAO;

import Paquete.basededatos.Conexion;
import Paquete.modelo.Clientes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author oscar
 */
public class DAOclientes {
    //Importar Base de Datos

    private Connection connection;

    public DAOclientes() {
        connection = Conexion.getConnection();
    }



public ArrayList<Clientes> QueryClientes(String q) {
        ArrayList<Clientes> cli = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * From clientes where nombre like ? or id_cliente like ? or apellido_cli like ?");
            ps.setString(1, q);
            ps.setString(2, q);
            ps.setString(3, q);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) // encontrado
            {
                Clientes c = new Clientes();
                c.setId_cliente(rs.getInt("id_cliente"));
                c.setNombre(rs.getString("nombre_cli"));
                c.setApellido(rs.getString("apellido_cli"));
                cli.add(c);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        }
        return cli;
    }
}
