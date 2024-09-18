import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      color: Color(0XFF757575),
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            textAlign: TextAlign.center,
            'Add Task',
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTaskTitle = newText;
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // Check if newTaskTitle is not null before adding the task
              if (newTaskTitle != null && newTaskTitle!.trim().isNotEmpty) {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle!);
                Navigator.pop(context);
              } else {
                print("Task title cannot be empty");
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.lightBlueAccent, // Text color
            ),
            child: Text('Add'),
          )
        ]),
      ),
    );
  }
}
