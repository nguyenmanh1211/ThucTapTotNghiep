package com.nguyenducmanh.service.impl;

import com.nguyenducmanh.entity.Databases;
import com.nguyenducmanh.entity.Lesson;
import com.nguyenducmanh.entity.User;
import com.nguyenducmanh.model.request.LessonRequest;
import com.nguyenducmanh.repository.DatabasesRepository;
import com.nguyenducmanh.repository.LessonRepository;
import com.nguyenducmanh.service.ILessonService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Service
public class LessonService implements ILessonService {


    private LessonRepository lessonRepository;
    private DatabasesRepository databasesRepository;

    @Autowired
    public LessonService(LessonRepository lessonRepository, DatabasesRepository databasesRepository) {
        this.lessonRepository = lessonRepository;
        this.databasesRepository = databasesRepository;
    }

    @Override
    public List<Lesson> findLessonByDatabases(String databaseName) {
        Databases databases= databasesRepository.findDatabasesByName(databaseName);
        List<Lesson> lessons = lessonRepository.findLessonByDatabases(databases);

        return lessons;
    }

    @Override
    public Lesson findOne(long id) {
        return lessonRepository.findOne(id);
    }

    @Override
    public void insert(LessonRequest lessonRequest) {
        Lesson lesson = new Lesson();
        BeanUtils.copyProperties(lessonRequest,lesson);
        Databases databases = databasesRepository.findOne(lessonRequest.getDatabaseID());
        lesson.setDatabases(databases);
        lessonRepository.save(lesson);
    }

    @Override
    public void update(LessonRequest lessonRequest, long id) {
        Lesson lesson = lessonRepository.findOne(id);
        if (lesson == null) return;
        lesson.setNameLesson(lessonRequest.getNameLesson());
        lesson.setTutorial(lessonRequest.getTutorial());
        lessonRepository.save(lesson);
    }

    @Override
    public void delete(long id) {
        Lesson lesson = lessonRepository.findOne(id);
        lessonRepository.delete(lesson);
    }

    @Override
    public List<Lesson> findLessonByText(String text,int page) {
        Pageable pageable = new PageRequest(page,5);
        return lessonRepository.findLessonByText(text,pageable);
    }

    @Override
    public Long count(String text) {
        return lessonRepository.findCount(text);
    }


}
