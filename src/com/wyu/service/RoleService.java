package com.wyu.service;

import com.wyu.domain.Role;

import java.util.List;

public interface RoleService {
    List<Role> findRole();

    int getTotal();

    int updateRoleByRid(Role role);

    int deleteRoleByRname(String rname);

    List<Role> searchRole(Role role);

    int addRole(Role role);
}
