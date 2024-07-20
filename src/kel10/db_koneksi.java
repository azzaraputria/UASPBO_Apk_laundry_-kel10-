package kel10;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class db_koneksi {
    Connection con;
    Statement st;

public void config() {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = (Connection) DriverManager.getConnection ("jdbc:mysql://localhost/laundry","root","");
        st = (Statement) con.createStatement();
    }catch(ClassNotFoundException | SQLException e) {
        JOptionPane.showMessageDialog(null, "Koneksi Gagal masuk ke Database!!!\n" + e.getMessage());
    }
  }
}
