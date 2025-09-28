/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.*;

/**
 *
 * @author Savindi
 */
public class MySQL {

    private static Connection connection;

    static {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/globemed_db", "root", "Savi@112233");

        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public static ResultSet execute(String query) throws Exception {

        Statement statement = connection.createStatement();

        if (query.startsWith("SELECT")) {
            return statement.executeQuery(query);

        } else {
            statement.executeUpdate(query);
            return null;
        }

    }

    public static int executeInsert(String sql) throws Exception {
        PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        ps.executeUpdate();
        ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public static ResultSet executeQuery(String sql, Object... params) throws Exception {
        PreparedStatement ps = connection.prepareStatement(sql);

        // set parameters dynamically
        for (int i = 0; i < params.length; i++) {
            Object param = params[i];
            if (param instanceof Integer) {
                ps.setInt(i + 1, (Integer) param);
            } else if (param instanceof String) {
                ps.setString(i + 1, (String) param);
            } else if (param instanceof java.sql.Time) {
                ps.setTime(i + 1, (java.sql.Time) param);
            } else if (param instanceof java.sql.Date) {
                ps.setDate(i + 1, (java.sql.Date) param);
            }
            // add more types if needed
        }

        return ps.executeQuery();
    }

}
