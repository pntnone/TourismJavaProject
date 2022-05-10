/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Admin
 */
public class SecurityConfig {
    private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();
    public static final String ADMIN_ROLE = "ad";
    public static final String PREMIUM_ROLE = "pr";
    public static final String USER_ROLE = "us";
    
    static {
        init();
    }

    private static void init() {        
        List<String> adminUrlPattern = new ArrayList<>();
        adminUrlPattern.add("/admin-tours");
        adminUrlPattern.add("/admin-tour-create");
        adminUrlPattern.add("/admin-tour-delete");
        adminUrlPattern.add("/admin-tour-update");
        mapConfig.put(ADMIN_ROLE, adminUrlPattern);
        // Premium User 
        List<String> premiumUrlPattern = new ArrayList<>();
        premiumUrlPattern.add("/admin");
        mapConfig.put(PREMIUM_ROLE, premiumUrlPattern);
        // Normal User
        List<String> userUrlPattern = new ArrayList<>();
        userUrlPattern.add("/admin");
        mapConfig.put(USER_ROLE, userUrlPattern);
    }
    
    public static Set<String> getAllAppRoles(){
        return mapConfig.keySet();
    }
    
    public static List<String> getUrlPatternsForRole(String role){
        return mapConfig.get(role);
    }
}
