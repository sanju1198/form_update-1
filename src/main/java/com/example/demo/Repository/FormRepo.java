package com.example.demo.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.FormEntity;

public interface FormRepo extends JpaRepository<FormEntity, Integer> {

} 