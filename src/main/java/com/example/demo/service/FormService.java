package com.example.demo.service;

import com.example.demo.DTO.ValidationResult;
import com.example.demo.entity.FormEntity;

import java.util.List;

public interface  FormService {
	FormEntity saveForm(FormEntity formEntity);
	ValidationResult validateForm(FormEntity formEntity);
	List<FormEntity> getAllForms();
	FormEntity getFormById(Long id);
	void deleteForm(Long id);
	FormEntity updateForm(FormEntity formEntity, Long id);
}