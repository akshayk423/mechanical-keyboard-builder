package com.mkbb.app.rest.Models;

import javax.persistence.*;

@Entity
@Table(name = "reportlistings")
public class Reported {

    @Id
    @GeneratedValue
    private String ReportListID;

    @Column
    private String PartID;

    public String getReportListID() {
        return ReportListID;
    }

    public void setReportListID(String reportListID) {
        ReportListID = reportListID;
    }

    public String getPartID() {
        return PartID;
    }

    public void setPartID(String partID) {
        PartID = partID;
    }
}
