/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pnttour.travelproject.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;




public class HttpUtil {
    
    private String stringJson;
    
    public HttpUtil(String stringJson){
        this.stringJson = stringJson;
    }
    
    public <T> T toModel(Class<T> tClass){
        try {
            return new ObjectMapper().readValue(stringJson,tClass);
        } catch (IOException ex) {
            Logger.getLogger(HttpUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static HttpUtil of(BufferedReader reader){
        StringBuilder sb = new StringBuilder();
        try{
            String line;
            while((line = reader.readLine())!=null){
                sb.append(line);
            }
        }catch(IOException ex){
            ex.printStackTrace();
        }
        
        return new HttpUtil(sb.toString());
    }
            
    
}
