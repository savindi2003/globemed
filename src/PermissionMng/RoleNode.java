/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PermissionMng;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;



public class RoleNode {
    private int roleId;
    private String roleName;
    private List<RoleNode> children = new ArrayList<>();
    private Set<String> directPermissions = new HashSet<>();

    public RoleNode(int id, String name) {
        this.roleId = id;
        this.roleName = name;
    }

    public void addChild(RoleNode child) {
        children.add(child);
    }

    public void addPermission(String perm) {
        if (perm != null && !perm.isEmpty()) {
            directPermissions.add(perm);
        }
    }

    public Set<String> getDirectPermissions() {
        return directPermissions; // DB assign කරන direct permission ටික
    }

    // Effective permissions = own + inherited from parent roles
    public Set<String> getEffectivePermissions() {
    return getEffectivePermissions(new HashSet<>());
}

private Set<String> getEffectivePermissions(Set<Integer> visited) {
    if (visited.contains(roleId)) {
        return Collections.emptySet(); // prevent circular loop
    }
    visited.add(roleId);

    Set<String> perms = new HashSet<>(directPermissions);
    for (RoleNode child : children) {
        perms.addAll(child.getEffectivePermissions(visited));
    }
    return perms;
}

    public String getRoleName() {
        return roleName;
    }

    public int getRoleId() {
        return roleId;
    }
}