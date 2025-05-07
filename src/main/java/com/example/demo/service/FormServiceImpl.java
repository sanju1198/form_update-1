package com.example.demo.service;

import com.example.demo.entity.FormEntity;
import com.example.demo.DTO.FormDTO;
import com.example.demo.DTO.ValidationResult;
import com.example.demo.Repository.FormRepo;
import com.example.demo.exception.ValidationException; // Use the custom exception

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FormServiceImpl implements FormService {


    private final FormRepo formRepository;
	@Autowired
	public FormServiceImpl(FormRepo formRepository) {
		this.formRepository = formRepository;
	}



	@Override
	public ValidationResult validateForm(FormEntity formEntity) {
		ValidationResult result = new ValidationResult();

		if (formEntity.getLandOwner() == null || formEntity.getLandOwner().trim().isEmpty()) {
			result.addError("landOwner", "Land Owner name cannot be empty");
		}

		if (formEntity.getFatherName() == null || formEntity.getFatherName().trim().isEmpty()) {
			result.addError("fatherName", "Father Name cannot be empty");
		}

		if (formEntity.getAadhaarNo() == null || !formEntity.getAadhaarNo().matches("\\d{12}")) {
			result.addError("aadhaarNo", "Aadhaar must be 12 digits");
		}

		if (formEntity.getKhataNo() == null || !formEntity.getKhataNo().matches("[A-Z0-9]+([-][A-Z0-9]+)*(/[A-Z]+)?")) {
			result.addError("khataNo", "Invalid Khata No format");
		}

		if (formEntity.getNewPattadarBook() == null) {
			result.addError("newPattadarBook", "Please select New Pattadar Book status");
		}

		if (formEntity.getNewPattadarBookNo() == null || !formEntity.getNewPattadarBookNo().matches("[T][A-Z]{2}[A-Z]{2}[0-9]{4}")) {
			result.addError("newPattadarBookNo", "Invalid New Pattadar Book No (e.g., TXXADXX1234)");
		}

		return result;
	}


	
	@Override
    public FormEntity saveForm(FormEntity formEntity) {
		return formRepository.save(formEntity);
        
    }
	@Override
	public List<FormEntity> getAllForms() {
		return formRepository.findAll();
	}

	@Override
	public FormEntity getFormById(Long id) {
		return formRepository.findById(id).orElse(null); // or throw a custom exception
	}

	@Override
	public void deleteForm(Long id) {
		formRepository.deleteById(id);
	}

}