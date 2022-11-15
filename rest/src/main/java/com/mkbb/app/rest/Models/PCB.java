package com.mkbb.app.rest.Models;

import javax.persistence.*;

@Entity
@Table(name = "pcb")
public class PCB {

    @Id
    @GeneratedValue
    private String partID;

    @Column
    private String containsRGB;

    @Column
    private String hotswappable;

    @Column
    private String size;


    public String getPartID() {
        return partID;
    }

    public void setPartID(String partID) {
        this.partID = partID;
    }

    public String getContainsRGB() {
        return containsRGB;
    }

    public void setContainsRGB(String containsRGB) {
        this.containsRGB = containsRGB;
    }

    public String getHotswappable() {
        return hotswappable;
    }

    public void setHotswappable(String hotswappable) {
        this.hotswappable = hotswappable;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
}
