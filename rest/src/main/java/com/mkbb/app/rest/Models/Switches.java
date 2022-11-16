package com.mkbb.app.rest.Models;

import javax.persistence.*;

@Entity
@Table(name = "switches")
public class Switches {

    @Id
    @GeneratedValue
    private String partID;

    @Column
    private String type;

    @Column
    private String stem;

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

    public String getStem() {
        return stem;
    }

    public void setStem(String stem) {
        this.stem = stem;
    }
}
