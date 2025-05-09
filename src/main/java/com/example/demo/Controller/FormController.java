package com.example.demo.Controller;

import com.example.demo.DTO.ValidationResult;
import com.example.demo.entity.FormEntity;
import com.example.demo.service.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@Controller
@RequestMapping("/forms")
public class FormController {

    private final FormService formService;
    private RedirectAttributes redirectAttributes;

    @Autowired
    public FormController(FormService formService) {
        this.formService = formService;
    }

    // Display all forms and default formEntity for creation
    @GetMapping
    public String listForms(Model model) {
        model.addAttribute("formEntity", new FormEntity());
        model.addAttribute("entries", formService.getAllForms());
        return "form"; // form.jsp
    }

    // Save new form
    @PostMapping("/save")
    public String saveForm(@ModelAttribute("formEntity") FormEntity formEntity,
                           Model model,
                           RedirectAttributes redirectAttributes) {

        ValidationResult result = formService.validateForm(formEntity);

        if (result.hasErrors()) {
            model.addAttribute("errors", result.getFieldErrors());
            model.addAttribute("entries", formService.getAllForms());
            model.addAttribute("showModal", true); // ✅ This is the key line
            return "form"; // your JSP file (e.g., form.jsp)
        }

        formService.saveForm(formEntity);
        redirectAttributes.addFlashAttribute("successMessage", "Form submitted successfully!");
        return "redirect:/forms";
    }



    @GetMapping("/{id}")
    @ResponseBody
    public ResponseEntity<FormEntity> getFormById(@PathVariable Long id) {
        FormEntity form = formService.getFormById(id);
        return ResponseEntity.ok(form);
    }



    @PostMapping("/update/{id}")
    public String updateForm(@PathVariable("id") Long id,
                             @ModelAttribute("formEntity") FormEntity formEntity,
                             Model model,
                             RedirectAttributes redirectAttributes) {

        ValidationResult result = formService.validateForm(formEntity);
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getFieldErrors());
            model.addAttribute("entries", formService.getAllForms());
            model.addAttribute("showModal", true);
            return "form";
        }

            formService.updateForm(formEntity, id);
            redirectAttributes.addFlashAttribute("successMessage", "Form updated successfully!");
            return "redirect:/forms";
    }





    // Delete form by ID
    @GetMapping("/delete/{id}")
    public String deleteForm(@PathVariable Long id, RedirectAttributes redirectAttributes) {

        try {
            formService.deleteForm(id);
            redirectAttributes.addFlashAttribute("successMessage", "Form deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while deleting the form.");
            e.printStackTrace();
        }

        return "redirect:/forms";
    }

}