package com.example.demo.Controller;

import com.example.demo.DTO.ValidationResult;
import com.example.demo.entity.FormEntity;
import com.example.demo.service.FormService;
import com.example.demo.exception.ValidationException; // Import the custom exception
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class FormController {

    @Autowired
    private FormService formService;

    @GetMapping("/form")
    public String showForm(Model model) {
        model.addAttribute("formEntity", new FormEntity());
        return "form";  
    }

//    @PostMapping("/form")
//    public String submitForm(@ModelAttribute FormEntity formEntity, Model model) {
//        try {
//            
//            formService.validateForm(formEntity);
//
//            
//            formService.saveForm(formEntity);
//
//            
//            model.addAttribute("message", "Form submitted successfully!");
//            return "Success";  
//        } catch (ValidationException e ) {
//            
//            model.addAttribute("message", "" + e.getMessage());
//            return "form";  
//        } 
//    }




    @PostMapping("/form")
    public String submitForm(@ModelAttribute("formEntity") FormEntity formEntity, Model model) {
        ValidationResult result = formService.validateForm(formEntity);

        if (result.hasErrors()) {
            model.addAttribute("errors", result.getFieldErrors());
            return "form"; // return to the same form page
        }

        formService.saveForm(formEntity);
        model.addAttribute("message", "Form submitted successfully!");
        return "Success";
    }


}