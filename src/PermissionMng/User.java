/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PermissionMng;

/**
 *
 * @author Savindi
 */
public class User {
    private int id;
    private String username;
    private int roleId;

    public User(int id, String username, int roleId) {
        this.id = id;
        this.username = username;
        this.roleId = roleId;
    }

    public int getId() { return id; }
    public String getUsername() { return username; }
    public int getRoleId() { return roleId; }
}
