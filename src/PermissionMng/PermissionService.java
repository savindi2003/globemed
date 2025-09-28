/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PermissionMng;

import PermissionMng.RoleNode;
import PermissionMng.User;


public class PermissionService {

    private RoleHierarchyBuilder hierarchy;

    public PermissionService(RoleHierarchyBuilder hierarchy) {
        this.hierarchy = hierarchy;
    }

    public boolean canPerform(User user, String permission) {
        RoleNode role = hierarchy.getRole(user.getRoleId());
    if (role == null) return false;

    return role.getEffectivePermissions()
               .contains(permission.trim().toUpperCase());
    }

}
