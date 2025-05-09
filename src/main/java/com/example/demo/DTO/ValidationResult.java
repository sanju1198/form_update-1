package com.example.demo.DTO;


import java.util.HashMap;
import java.util.Map;

public class ValidationResult {
    private final Map<String, String> fieldErrors = new HashMap<>();

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

