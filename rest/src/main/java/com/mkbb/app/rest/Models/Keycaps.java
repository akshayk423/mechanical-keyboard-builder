package com.mkbb.app.rest.Models;

import javax.persistence.*;

@Entity
@Table(name = "keycaps")
public class Keycaps {

    @Id
    @GeneratedValue
    private String partID;

    @Column
    private String profile;

    @Column
    private String material;

    public String getPartID() {
        return partID;
    }

    public void setPartID(String partID) {
        this.partID = partID;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }
}
