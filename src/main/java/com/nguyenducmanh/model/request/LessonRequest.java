package com.nguyenducmanh.model.request;

import java.awt.*;

public class LessonRequest {
    private long id;
    private String nameLesson;
    private String tutorial;
    private long databaseID;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getNameLesson() {
        return nameLesson;
    }

    public void setNameLesson(String nameLesson) {
        this.nameLesson = nameLesson;
    }

    public String getTutorial() {
        return tutorial;
    }

    public void setTutorial(String tutorial) {
        this.tutorial = tutorial;
    }

    public long getDatabaseID() {
        return databaseID;
    }

    public void setDatabaseID(long databaseID) {
        this.databaseID = databaseID;
    }
}
