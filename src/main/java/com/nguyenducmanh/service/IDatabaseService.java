package com.nguyenducmanh.service;

import com.nguyenducmanh.entity.Databases;
import com.nguyenducmanh.model.request.DatabaseRequest;

import java.util.List;

public interface IDatabaseService {
    List<Databases> findAll();

    Databases findOne(long id);
    Databases insert(DatabaseRequest databaseRequest);
    void delete(long id);
    void update(DatabaseRequest databaseRequest,long id);
    Databases findDatabasesByName(String name);
}
