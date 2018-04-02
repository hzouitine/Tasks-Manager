package com.hzouitine.taskmanager.dao;

import com.hzouitine.taskmanager.model.Task;
import org.springframework.data.repository.CrudRepository;

public interface  TaskRepository extends CrudRepository<Task, Integer> {

}
