package com.example.demo.DTO;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ValidationResult {
    private Map<String, String> fieldErrors = new HashMap<>();

    public ValidationResult() {}

    public void addError(String field, String message) {
        fieldErrors.put(field, message);
    }

    public Map<String, String> getFieldErrors() {
        return fieldErrors;
    }

    public boolean hasErrors() {
        return !fieldErrors.isEmpty();
    }
}

