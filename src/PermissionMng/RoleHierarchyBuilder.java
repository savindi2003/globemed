/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PermissionMng;

import Model.MySQL;
import PermissionMng.RoleNode;

import java.sql.ResultSet;
import java.util.*;

//public class RoleHierarchyBuilder {
//
//    private Map<Integer, RoleNode> roleMap = new HashMap<>();
//
//    public void loadRoles() throws Exception {
//        // 1. load roles
//        ResultSet rs = MySQL.execute("SELECT `id`, `name`, `parent_id` FROM `job_role`");
//        Map<Integer, Integer> parentMap = new HashMap<>();
//
//        while (rs.next()) {
//            int id = rs.getInt("id");
//            String name = rs.getString("name");
//            Integer parentId = (Integer) rs.getObject("parent_id");
//
//            RoleNode role = new RoleNode(id, name);
//            roleMap.put(id, role);
//            if (parentId != null) {
//                parentMap.put(id, parentId);
//            }
//        }
//
//        // 2. link parent-child
//        for (Map.Entry<Integer, Integer> e : parentMap.entrySet()) {
//            int childId = e.getKey();
//            int parentId = e.getValue();
//            RoleNode parent = roleMap.get(parentId);
//            RoleNode child = roleMap.get(childId);
//            if (parent != null && child != null) {
//                parent.addChild(child);
//            }
//        }
//
//        // 3. assign permissions
//        ResultSet prs = MySQL.execute(
//                "SELECT jr.id AS role, GROUP_CONCAT(p.name) AS permissions " +
//                "FROM job_role jr " +
//                "LEFT JOIN role_permission rp ON jr.id = rp.role_id " +
//                "LEFT JOIN permissions p ON rp.permission_id = p.id " +
//                "GROUP BY jr.id"
//        );
//
//        while (prs.next()) {
//            int roleId = prs.getInt("role");
//            String perm = prs.getString("permissions");
//            RoleNode node = roleMap.get(roleId);
//
//            if (node != null && perm != null) {
//                for (String p : perm.split(",")) {
//                    node.addPermission(p.trim().toUpperCase());
//                }
//            }
//        }
//
//        // Debug print
//        for (RoleNode role : roleMap.values()) {
//            System.out.println(role.getRoleName() + " => " + role.getEffectivePermissions());
//        }
//    }
//
//    public RoleNode getRole(int roleId) {
//        return roleMap.get(roleId);
//    }
//}


public class RoleHierarchyBuilder {

    private Map<Integer, RoleNode> roleMap = new HashMap<>();

    public void loadRoles() throws Exception {
        // 1. load roles
        ResultSet rs = MySQL.execute("SELECT `id`, `name`, `parent_id` FROM `job_role`");
        Map<Integer, Integer> parentMap = new HashMap<>();

        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            Integer parentId = (Integer) rs.getObject("parent_id");

            RoleNode role = new RoleNode(id, name);
            roleMap.put(id, role);

            if (parentId != null) {
                parentMap.put(id, parentId);
            }
        }

        // 2. link parent-child hierarchy
        for (Map.Entry<Integer, Integer> e : parentMap.entrySet()) {
            int childId = e.getKey();
            int parentId = e.getValue();
            RoleNode parent = roleMap.get(parentId);
            RoleNode child = roleMap.get(childId);
            if (parent != null && child != null) {
                parent.addChild(child);
            }
        }

        // 3. assign direct permissions from DB
        ResultSet prs = MySQL.execute(
            "SELECT jr.id AS role, GROUP_CONCAT(p.name) AS permissions " +
            "FROM job_role jr " +
            "LEFT JOIN role_permission rp ON jr.id = rp.role_id " +
            "LEFT JOIN permissions p ON rp.permission_id = p.id " +
            "GROUP BY jr.id"
        );

        while (prs.next()) {
            int roleId = prs.getInt("role");
            String perm = prs.getString("permissions");
            RoleNode node = roleMap.get(roleId);

            if (node != null && perm != null) {
                for (String p : perm.split(",")) {
                    node.addPermission(p.trim().toUpperCase());
                }
            }
        }

        // Debug print → Effective permissions
        for (RoleNode role : roleMap.values()) {
            System.out.println(role.getRoleName() + " => " + role.getEffectivePermissions());
        }
    }

    public RoleNode getRole(int roleId) {
        return roleMap.get(roleId);
    }
}