package com.nguyenducmanh.controller;

import com.nguyenducmanh.entity.Databases;
import com.nguyenducmanh.entity.Feedback;
import com.nguyenducmanh.entity.Lesson;
import com.nguyenducmanh.service.IDatabaseService;
import com.nguyenducmanh.service.IFeedbackService;
import com.nguyenducmanh.service.ILessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {
    private ILessonService lessonService;
    private IFeedbackService feedbackService;
    private IDatabaseService databaseService;

    @Autowired
    public AdminController(ILessonService lessonService, IDatabaseService databaseService, IFeedbackService feedbackService) {
        this.lessonService = lessonService;
        this.databaseService = databaseService;
        this.feedbackService = feedbackService;
    }

    @GetMapping("/home")
    public ModelAndView adminHome() {
        return new ModelAndView("home-admin");
    }

    @GetMapping("/databases")
    public ModelAndView dataTable(@RequestParam(value = "databaseName") String databaseName) {
        ModelAndView mav = new ModelAndView("lesson-table");
        List<Lesson> lessons = lessonService.findLessonByDatabases(databaseName);
        mav.addObject("lessons", lessons);
        Databases databases = databaseService.findDatabasesByName(databaseName);
        mav.addObject("database", databases);
        return mav;
    }

    @GetMapping("/database")
    public ModelAndView findAllDatabase() {
        ModelAndView mav = new ModelAndView("database-table");
        List<Databases> list = databaseService.findAll();
        mav.addObject("list", list);
        return mav;
    }

    @GetMapping("/feedback")
    public ModelAndView feedback() {
        ModelAndView mav = new ModelAndView("feedback-table");
        List<Feedback> feedback = feedbackService.finAll();
        mav.addObject("feedback", feedback);
        return mav;
    }

    @GetMapping("/feedbackProperties")
    public ModelAndView feedbackProperties(@RequestParam long id) {
        ModelAndView mav = new ModelAndView("feedback-properties");
        mav.addObject("id", id);
        mav.addObject("feedback", feedbackService.findOne(id));
        return mav;
    }

    @GetMapping("/lessonProperties")
    public ModelAndView lessonProperties(@RequestParam long id) {
        ModelAndView mav = new ModelAndView("lesson-properties");
        mav.addObject("id", id);
        mav.addObject("lesson", lessonService.findOne(id));
        Databases databases = lessonService.findOne(id).getDatabases();
        mav.addObject("database", databases);
        return mav;
    }
}