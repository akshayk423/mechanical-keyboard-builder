package com.mkbb.app.rest.Models;

import javax.persistence.*;

@Entity
@Table(name = "stabilizers")
public class Stablizers {

    @Id
    @GeneratedValue
    private String partID;

    @Column
    private String stabtype;

    @Column
    private String info;


    public String getPartID() {
        return partID;
    }

    public void setPartID(String partID) {
        this.partID = partID;
    }

    public String getStabType() {
        return stabtype;
    }

    public void setStabType(String stabType) {
        this.stabtype = stabType;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }
}
