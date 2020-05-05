package com.nguyenducmanh.service;

import com.nguyenducmanh.entity.Feedback;
import com.nguyenducmanh.model.request.FeedbackRequest;

import java.util.List;

public interface IFeedbackService {
    List<Feedback> finAll();
    void insert(FeedbackRequest feedbackRequest);
    void delete(long id);
    Feedback findOne(long id);
}
