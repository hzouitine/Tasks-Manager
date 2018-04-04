package com.hzouitine.taskmanager.controller;

import com.hzouitine.taskmanager.model.Task;
import com.hzouitine.taskmanager.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
public class SampleRestController {

    private TaskService taskService;

    @Autowired
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @GetMapping("/tasks")
    public String tasks(){
        return taskService.findAll().toString();
    }

    @PostMapping("/tasks")
    public String saveTask(@RequestParam String name, @RequestParam String description){
        Task task = new Task(name,description, new Date(), false);
        taskService.save(task);
        return "Task Saved";
    }

    @DeleteMapping("/tasks")
    public String deleteTask(@RequestParam int id){
        taskService.delete(id);
        return "Task Deleted";
    }
}
