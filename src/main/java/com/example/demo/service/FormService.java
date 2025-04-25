package com.example.demo.service;

import com.example.demo.DTO.ValidationResult;
import com.example.demo.entity.FormEntity;

public interface  FormService {
	FormEntity saveForm(FormEntity formEntity);
	//void validateForm(FormEntity formEntity);
	ValidationResult validateForm(FormEntity formEntity);
}