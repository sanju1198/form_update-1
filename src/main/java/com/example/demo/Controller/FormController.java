package com.example.demo.Controller;

import com.example.demo.DTO.ValidationResult;
import com.example.demo.entity.FormEntity;
import com.example.demo.service.FormService;
import com.example.demo.exception.ValidationException;//
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/forms")
public class FormController {

    private final FormService formService;

    @Autowired
    public FormController(FormService formService) {
        this.formService = formService;
    }

    // Display all forms and default formEntity for creation
    @GetMapping
    public String listForms(Model model) {
        model.addAttribute("formEntity", new FormEntity()); // empty for the creation modal
        model.addAttribute("entries", formService.getAllForms());
        return "form"; // form.jsp
    }

    // Save new form
    @PostMapping("/save")
    public String saveForm(@ModelAttribute("formEntity") FormEntity formEntity, Model model, RedirectAttributes redirectAttributes) {
        ValidationResult result;
        result = formService.validateForm(formEntity);

        if (result.hasErrors()) {
            model.addAttribute("errors", result.getFieldErrors());
            model.addAttribute("entries", formService.getAllForms());
            return "form";
        }

        formService.saveForm(formEntity);

        // Add a success message as a flash attribute
        redirectAttributes.addFlashAttribute("successMessage", "Form submitted successfully!");

        return "redirect:/forms"; // Redirect back to the form page
    }


    // Get a single form by ID (for modal pre-fill)
    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<FormEntity> getFormById(@PathVariable Long id) {
        FormEntity form = formService.getFormById(id);
        return ResponseEntity.ok(form);
    }

    // Update existing form
    @PostMapping("/update")
    public String updateForm(@ModelAttribute("formEntity") FormEntity formEntity, Model model) {
        ValidationResult result = formService.validateForm(formEntity);

        if (result.hasErrors()) {
            model.addAttribute("errors", result.getFieldErrors());
            model.addAttribute("entries", formService.getAllForms());
            return "form";
        }

        formService.saveForm(formEntity); // JPA save() handles both insert & update
        return "redirect:/forms";
    }

    // Delete form by ID
    @GetMapping("/delete/{id}")
    public String deleteForm(@PathVariable Long id) {
        formService.deleteForm(id);
        return "redirect:/forms";
    }
}
