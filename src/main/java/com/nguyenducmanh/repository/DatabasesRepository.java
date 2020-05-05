package com.nguyenducmanh.repository;

import com.nguyenducmanh.entity.Databases;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DatabasesRepository extends JpaRepository<Databases,Long> {
    Databases findDatabasesByName(String databaseName);

}
