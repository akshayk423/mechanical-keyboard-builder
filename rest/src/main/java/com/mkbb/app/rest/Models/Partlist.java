package com.mkbb.app.rest.Models;

import javax.persistence.*;

@Entity
@Table(name = "partlist")
public class Partlist {

    @Id
    @GeneratedValue
    private String partlistID;

    @Column
    private String username;

    @Column
    private double totalPrice;

    @Column
    private String pcb_id;

    @Column
    private String accessories_id;

    @Column
    private String switches_id;

    @Column
    private String case_id;

    @Column
    private String stab_id;

    @Column
    private String keycaps_id;

    public String getPartListID() {
        return partlistID;
    }

    public void setPartListID(String partListID) {
        this.partlistID = partListID;
    }

    public String getUserName() {
        return username;
    }

    public void setUserName(String userName) {
        this.username = userName;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPcb_id() {
        return pcb_id;
    }

    public void setPcb_id(String pcb_id) {
        this.pcb_id = pcb_id;
    }

    public String getAccessories_id() {
        return accessories_id;
    }

    public void setAccessories_id(String accessories_id) {
        this.accessories_id = accessories_id;
    }

    public String getSwitches_id() {
        return switches_id;
    }

    public void setSwitches_id(String switches_id) {
        this.switches_id = switches_id;
    }

    public String getCase_id() {
        return case_id;
    }

    public void setCase_id(String case_id) {
        this.case_id = case_id;
    }

    public String getStab_id() {
        return stab_id;
    }

    public void setStab_id(String stab_id) {
        this.stab_id = stab_id;
    }

    public String getKeycaps_id() {
        return keycaps_id;
    }

    public void setKeycaps_id(String keycaps_id) {
        this.keycaps_id = keycaps_id;
    }
}
