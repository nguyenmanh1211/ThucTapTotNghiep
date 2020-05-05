package com.nguyenducmanh.controller;

import com.nguyenducmanh.model.request.FeedbackRequest;
import com.nguyenducmanh.service.IFeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FeedbackController {
    @Autowired
    private IFeedbackService feedbackService;

    @RequestMapping("/feedbackApi")
    public String insert(@RequestBody @ModelAttribute(value = "feedback")FeedbackRequest feedbackRequest){
        feedbackService.insert(feedbackRequest);
        return "redirect:/home";
    }
    @RequestMapping("/deleteFeedback")
    public String delete(@RequestParam long id){
        feedbackService.delete(id);
        return "redirect:/admin/feedback";
    }
}
