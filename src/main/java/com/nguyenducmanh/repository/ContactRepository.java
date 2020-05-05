package com.nguyenducmanh.repository;

import com.nguyenducmanh.entity.Contact;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactRepository extends JpaRepository<Contact,Long> {

}
