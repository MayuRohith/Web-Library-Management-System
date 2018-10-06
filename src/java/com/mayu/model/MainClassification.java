/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.model;

/**
 *
 * @author MayuKogi
 */
public class MainClassification {
    String mainClassification, mainId;
    public String getMainId(){
        return mainId;
    }
    
    public String getMainClassification(){
        return mainClassification;
    }
    
    public void setMainClassification(String mainclass){
        this.mainClassification = mainclass;
    }
    
    public void setMainId(String mainId){
        this.mainId=mainId;
    
    }
}
