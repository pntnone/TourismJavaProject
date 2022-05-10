/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.utils;

import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Admin
 */
public class SecurityUtil {

    public static boolean isSecurityPage(HttpServletRequest request) {
        String urlPattern = UrlPatternUtils.getUrlPattern(request);

        Set<String> roles = SecurityConfig.getAllAppRoles();

        for (String role : roles) {
            List<String> urlPatterns = SecurityConfig.getUrlPatternsForRole(role);
            if (urlPatterns != null && urlPatterns.contains(urlPattern)) {
                return true;
            }
        }
        return false;
    }

    public static boolean hasPermission(HttpServletRequest request,String roleCode) {
        String urlPattern = UrlPatternUtils.getUrlPattern(request);

        List<String> urls = SecurityConfig.getUrlPatternsForRole(roleCode);
        
        if(urls!=null){
            if(urls.contains(urlPattern)){
                return true;
            }
        }
        
        return false;
    }
}
