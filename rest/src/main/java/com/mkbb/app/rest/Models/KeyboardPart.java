package com.mkbb.app.rest.Models;


import javax.persistence.*;

@Entity
@Table(name = "keyboardpart")
public class KeyboardPart {
    @Id
    @GeneratedValue
    private String partID;

    @Column
    private String URL;

    @Column
    private String name;

    @Column
    private String brand;

    @Column
    private double price;

    @Column
    private String username;


    public String getPartID() {
        return partID;
    }

    public void setPartID(String partID) {
        this.partID = partID;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
