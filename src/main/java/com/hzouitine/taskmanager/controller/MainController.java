package com.hzouitine.taskmanager.controller;

import com.hzouitine.taskmanager.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class MainController {

    private TaskService taskService;

    @Autowired
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/")
    public String index(Model model){
        model.addAttribute("tasks",taskService.findAll());
        return "index";
    }

    @GetMapping("/delete")
    public String deleteTask(@RequestParam int id, HttpServletResponse res){
        taskService.delete(id);
        return "redirect:/";
    }

}
