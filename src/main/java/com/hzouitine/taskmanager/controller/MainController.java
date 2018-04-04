package com.hzouitine.taskmanager.controller;

import com.hzouitine.taskmanager.model.Task;
import com.hzouitine.taskmanager.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@Controller
public class MainController {

    private TaskService taskService;

    @Autowired
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("tasks", taskService.findAll());
        return "index";
    }

    @PostMapping("/")
    public String index(Model model, @ModelAttribute Task task) {
        Integer id = task.getId();
        if(id == null)
            task.setDateCreated(new Date());
        else
            task.setDateCreated(taskService.findById(id).getDateCreated());
        taskService.save(task);
        model.addAttribute("tasks", taskService.findAll());
        return "index";
    }

    @GetMapping("/delete")
    public String deleteTask(@RequestParam int id, HttpServletResponse res) {
        taskService.delete(id);
        return "redirect:/";
    }

    @GetMapping("/task")
    public String saveTask(@RequestParam(required = false) Integer id, @RequestParam(required = false) String name,
                           @RequestParam(required = false) String description, @RequestParam(required = false) boolean finished, Model model) {

        Task task;
        task = new Task(name, description, null, finished);
        task.setId(id);
        model.addAttribute("command", task);
        return "newTask";
    }
}
