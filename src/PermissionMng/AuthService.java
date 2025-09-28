/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PermissionMng;

import java.sql.ResultSet;
import Model.MySQL;
import java.util.Base64;

/**
 *
 * @author Savindi
 */
public class AuthService {

    private String safeEncrypt(String value) {
        if (value == null) {
            return null;
        }
        return Base64.getEncoder().encodeToString(value.getBytes());
    }

    private String safeDecrypt(String value) {
        if (value == null) {
            return null;
        }
        try {
            return new String(Base64.getDecoder().decode(value));
        } catch (IllegalArgumentException e) {
            return value; // not encoded → return as-is
        }
    }

    public User login(String username, String password) throws Exception {
        ResultSet rs = MySQL.executeQuery(
                "SELECT id, username, password, job_role_id FROM staff WHERE username=?",
                safeEncrypt(username)
        );

        if (rs.next()) {
            String storedPw = rs.getString("password");

            // simple check (for demo) – real system එකේ hash verify කරන්න
            if (storedPw.equals(password)) {
                return new User(
                        rs.getInt("id"),
                        safeDecrypt(rs.getString("username")),
                        rs.getInt("job_role_id")
                );
            }
        }
        return null; // login fail
    }
}
