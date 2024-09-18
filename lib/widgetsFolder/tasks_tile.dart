import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String taskTitle;
  final Function checkboxcallback;
  final void Function() longPresscallback;

  TaskTile(
      {this.isChecked,
      required this.taskTitle,
      required this.checkboxcallback,
      required this.longPresscallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPresscallback,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (newValue) {
          checkboxcallback(newValue);
        },
      ),
    );
  }
}
