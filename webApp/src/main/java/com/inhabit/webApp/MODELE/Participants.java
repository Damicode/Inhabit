package com.inhabit.webApp.MODELE;

import jakarta.persistence.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Table(name = "participants")
@Entity
public class Participants {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long Id;

    private String FirsName;
    private  String LastName;
    private String MidleName;

    public Participants() {
    }

    public Participants(String firsName, String lastName, String midleName) {
        FirsName = firsName;
        LastName = lastName;
        MidleName = midleName;
    }

    public Participants(Long id, String firsName, String lastName, String midleName) {
        Id = id;
        FirsName = firsName;
        LastName = lastName;
        MidleName = midleName;
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getFirsName() {
        return FirsName;
    }

    public void setFirsName(String firsName) {
        FirsName = firsName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    public String getMidleName() {
        return MidleName;
    }

    public void setMidleName(String midleName) {
        MidleName = midleName;
    }

    @Override
    public String toString() {
        return "participants{" +
                "Id=" + Id +
                ", FirsName='" + FirsName + '\'' +
                ", LastName='" + LastName + '\'' +
                ", MidleName='" + MidleName + '\'' +
                '}';
    }
}
