package com.nguyenducmanh.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "lesson")
public class Lesson extends Base{
    @Column(name = "namelesson")
    private String nameLesson;
    @Column(name = "tutorial")
    private String tutorial;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "database_id")
    private Databases databases;


    public String getNameLesson() {
        return nameLesson;
    }

    public void setNameLesson(String nameLesson) {
        this.nameLesson = nameLesson;
    }

    public Databases getDatabases() {
        return databases;
    }

    public void setDatabases(Databases databases) {
        this.databases = databases;
    }

    public String getTutorial() {
        return tutorial;
    }

    public void setTutorial(String tutorial) {
        this.tutorial = tutorial;
    }
}
