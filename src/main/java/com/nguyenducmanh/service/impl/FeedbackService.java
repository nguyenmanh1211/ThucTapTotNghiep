package com.nguyenducmanh.service.impl;

import com.nguyenducmanh.entity.Feedback;
import com.nguyenducmanh.model.request.FeedbackRequest;
import com.nguyenducmanh.repository.FeedbackRepository;
import com.nguyenducmanh.service.IFeedbackService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FeedbackService implements IFeedbackService {
    @Autowired
    private FeedbackRepository feedbackRepository;
    @Override
    public List<Feedback> finAll() {
        return feedbackRepository.findAll();
    }

    @Override
    public void insert(FeedbackRequest feedbackRequest) {
        Feedback feedback = new Feedback();
        BeanUtils.copyProperties(feedbackRequest,feedback);
        feedbackRepository.save(feedback);
    }

    @Override
    public void delete(long id) {
        Feedback feedback = feedbackRepository.findOne(id);
        feedbackRepository.delete(feedback);
    }

    @Override
    public Feedback findOne(long id) {
        return feedbackRepository.findOne(id);
    }
}
