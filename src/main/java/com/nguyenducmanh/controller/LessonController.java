package com.nguyenducmanh.controller;

import com.nguyenducmanh.entity.Databases;
import com.nguyenducmanh.entity.Lesson;
import com.nguyenducmanh.service.IDatabaseService;
import com.nguyenducmanh.service.ILessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@RestController
public class LessonController {

    private ILessonService iLessonService;
    private IDatabaseService databaseService;

    @Autowired
    public LessonController(ILessonService iLessonService,IDatabaseService databaseService) {
        this.iLessonService = iLessonService;
        this.databaseService = databaseService;
    }

    @RequestMapping(value = "/database", method = RequestMethod.GET)
    public ModelAndView findLessonByDatabase(@RequestParam String databaseName) {
        ModelAndView mav = new ModelAndView("lesson-web");
        List<Lesson> lessons = iLessonService.findLessonByDatabases(databaseName);
        mav.addObject("lessons", lessons);
        return mav;
    }

    @RequestMapping(value = "/api", method = RequestMethod.GET)
    public Lesson getLesson(@RequestParam(value = "id") Long id) {
        Lesson lessonProperties = iLessonService.findOne(id);
        return lessonProperties;
    }

    @RequestMapping(value = "/dataJs", method = RequestMethod.GET)
    public Databases getDatabaseJs(@RequestParam(value = "id") long id) {
        Databases databases = databaseService.findOne(id);
        return databases;
    }

    @RequestMapping(value = "/searchUs")
    public List<Lesson> findLsByText(@RequestParam String text,@RequestParam int page){
        return iLessonService.findLessonByText(text,page);
    }

    @RequestMapping(value = "/searchLs", method = RequestMethod.GET)
    public ModelAndView findAll(@RequestParam String text,@RequestParam int page) {
        ModelAndView mav = new ModelAndView("search");
        long count= iLessonService.count(text)/5;
        List<Lesson> list = iLessonService.findLessonByText(text,page);
        List<Long> integers = new ArrayList<>();
        if(count == 0) integers.add(count);
        else {
            for (long i = 0; i < count; i++) {
                integers.add(i);
            }
        }
        integers.add(count);
        mav.addObject("count", integers);
        mav.addObject("limit",count);
        mav.addObject("offset", text);
        mav.addObject("page",page);
        mav.addObject("list", list);
        return mav;
    }
    @RequestMapping(value = "/findLsById", method = RequestMethod.GET)
    public ModelAndView getLs(@RequestParam(value = "id") Long id) {
        ModelAndView mav = new ModelAndView("lesson-web");
        Lesson lessonProperties = iLessonService.findOne(id);
        List<Lesson> lessons = iLessonService.findLessonByDatabases(lessonProperties.getDatabases().getName());
        mav.addObject("ttra",lessonProperties.getTutorial());
        mav.addObject("lessons",lessons);
        return mav;
    }
}
