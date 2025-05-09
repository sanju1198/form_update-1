package com.example.demo.entity;

import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;

import javax.persistence.*;

@Table(name = "pattadar_form")
@Entity
public class FormEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "aadhaar_no", length = 12)
    private String aadhaarNo;

    @Column(name = "father_name", length = 100)
    private String fatherName;

    @Column(name = "khata_no", length = 30)
    private String khataNo;

    @Column(name = "land_owner", length = 100)
    private String landOwner;

    @Column(name = "new_pattadar_book", columnDefinition = "BIT(1)")
    private boolean newPattadarBook;

    @Column(name = "new_pattadar_book_no", length = 50)  // or 100
    private String newPattadarBookNo;

    @Column(name = "old_pattadar_book", columnDefinition = "BIT(1)")
    private boolean oldPattadarBook;
    // Getters and Setters
    public String getLandOwner() {
        return landOwner;
    }

    public void setLandOwner(String landOwner) {
        this.landOwner = landOwner;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getAadhaarNo() {
        return aadhaarNo;
    }

    public void setAadhaarNo(String aadhaarNo) {
        this.aadhaarNo = aadhaarNo;
    }

    public Boolean getNewPattadarBook() {
        return newPattadarBook;
    }

    public void setNewPattadarBook(Boolean newPattadarBook) {
        this.newPattadarBook = newPattadarBook;
    }

    public String getNewPattadarBookNo() {
        return newPattadarBookNo;
    }

    public void setNewPattadarBookNo(String newPattadarBookNo) {
        this.newPattadarBookNo = newPattadarBookNo;
    }

    public Boolean getOldPattadarBook() {
        return oldPattadarBook;
    }

    public void setOldPattadarBook(Boolean oldPattadarBook) {
        this.oldPattadarBook = oldPattadarBook;
    }

    public String getKhataNo() {
        return khataNo;
    }

    public void setKhataNo(String khataNo) {
        this.khataNo = khataNo;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}