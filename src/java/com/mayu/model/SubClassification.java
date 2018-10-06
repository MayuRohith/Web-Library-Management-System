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
public class SubClassification {
    
    String subClassification, subId,mainId;
    public String getMainId(){
        return mainId;
    }
    public String getSubId(){
        return subId;
    }
    
    public String getSubClassification(){
        return subClassification;
    }
    
    public void setSubClassification(String subclass){
        this.subClassification = subclass;
    }
    
    public void setSubId(String subId){
        this.subId=subId;
    }
    public void setMainId(String mainId){
        this.mainId=mainId;
    }
}

    

