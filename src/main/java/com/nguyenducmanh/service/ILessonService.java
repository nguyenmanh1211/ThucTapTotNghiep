package com.nguyenducmanh.service;

import com.nguyenducmanh.entity.Lesson;
import com.nguyenducmanh.model.request.LessonRequest;

import java.util.List;

public interface ILessonService {
    List<Lesson> findLessonByDatabases(String databaseId);
    Lesson findOne(long id);
    void insert(LessonRequest lessonRequest);
    void update(LessonRequest lessonRequest,long id);
    void delete(long id);
    List<Lesson> findLessonByText(String text,int page);
    Long count(String text);
}
