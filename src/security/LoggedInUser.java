/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package security;

/**
 *
 * @author Savindi
 */
public class LoggedInUser {
    private static String username;
    private static String role;

    public static void setUser(String u, String r) {
        username = u;
        role = r;
    }

    public static String getUsername() {
        return username;
    }

    public static String getRole() {
        return role;
    }
}
