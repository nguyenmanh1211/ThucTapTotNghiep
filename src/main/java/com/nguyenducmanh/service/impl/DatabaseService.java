package com.nguyenducmanh.service.impl;

import com.nguyenducmanh.entity.Databases;
import com.nguyenducmanh.model.request.DatabaseRequest;
import com.nguyenducmanh.repository.DatabasesRepository;
import com.nguyenducmanh.service.IDatabaseService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DatabaseService implements IDatabaseService {
    @Autowired
    private DatabasesRepository databasesRepository;

    @Override
    public List<Databases> findAll() {
        return databasesRepository.findAll();
    }

    @Override
    public Databases findOne(long id) {
        return databasesRepository.findOne(id);
    }

    @Override
    public Databases insert(DatabaseRequest databaseRequest) {
        Databases databases = new Databases();
        BeanUtils.copyProperties(databaseRequest,databases);
        return databasesRepository.save(databases);
    }

    @Override
    public void delete(long id) {
        Databases databases = databasesRepository.findOne(id);
        databasesRepository.delete(databases);
    }

    @Override
    public void update(DatabaseRequest databaseRequest, long id) {
        Databases databases = databasesRepository.findOne(id);
        if (databases == null) return;
        databases.setName(databaseRequest.getName());
        databasesRepository.save(databases);
    }

    @Override
    public Databases findDatabasesByName(String name) {
        return databasesRepository.findDatabasesByName(name);
    }
}
