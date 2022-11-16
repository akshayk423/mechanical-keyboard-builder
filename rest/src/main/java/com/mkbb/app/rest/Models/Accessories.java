package com.mkbb.app.rest.Models;

import javax.persistence.*;

@Entity
@Table(name = "accessories")
public class Accessories {

    @Id
    @GeneratedValue
    private String partID;

    @Column
    private String type;

    public String getPartID() {
        return partID;
    }

    public void setPartID(String partID) {
        this.partID = partID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
