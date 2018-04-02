package com.hzouitine.taskmanager.service;

import com.hzouitine.taskmanager.dao.TaskRepository;
import com.hzouitine.taskmanager.model.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class TaskService {

    private TaskRepository taskRepository;

    @Autowired
    public TaskService(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    public List<Task> findAll(){
        List<Task> tasks = new ArrayList<>();
         for( Task t : taskRepository.findAll())
             tasks.add(t);
         return tasks;
    }

}
