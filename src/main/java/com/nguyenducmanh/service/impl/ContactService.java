package com.nguyenducmanh.service.impl;

import com.nguyenducmanh.entity.Contact;
import com.nguyenducmanh.repository.ContactRepository;
import com.nguyenducmanh.service.IContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContactService implements IContactService {
    private ContactRepository contactRepository;

    @Autowired
    public ContactService(ContactRepository contactRepository) {
        this.contactRepository = contactRepository;
    }

    @Override
    public Contact findOne() {
        long id=1;
        return contactRepository.findOne(id);
    }
}
