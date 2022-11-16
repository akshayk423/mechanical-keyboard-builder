package com.mkbb.app.rest.Models;

import javax.persistence.*;

@Entity
@Table(name = "moderators")
public class Mods {

    @Id
    @GeneratedValue
    private String modID;

    @Column
    private String password;

    public String getModID() {
        return modID;
    }

    public void setModID(String modID) {
        this.modID = modID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
