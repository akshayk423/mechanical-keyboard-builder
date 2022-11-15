package com.mkbb.app.rest.Models;

import org.springframework.web.bind.annotation.CookieValue;

import javax.persistence.*;

@Entity
@Table(name = "prebuilt")
public class Prebuilt{

    @Id
    @GeneratedValue
    private String partID;

    @Column
    private String switchName;

    @Column
    private String hotswappable;


    public String getPartID() {
        return partID;
    }

    public void setPartID(String partID) {
        this.partID = partID;
    }

    public String getSwitchName() {
        return switchName;
    }

    public void setSwitchName(String switchName) {
        this.switchName = switchName;
    }

    public String getHotswappable() {
        return hotswappable;
    }

    public void setHotswappable(String hotswappable) {
        this.hotswappable = hotswappable;
    }
}
