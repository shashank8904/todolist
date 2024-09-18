import 'package:flutter/material.dart';
import 'package:todolist/widgetsFolder/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxcallback: (bool? checkboxState) {
                taskData.updateTask(task);
              },
              longPresscallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.TaskCount,
        );
      },
    );
  }
}
