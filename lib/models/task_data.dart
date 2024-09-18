import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'add Task'),
    Task(name: 'Longpress to Delete')
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get TaskCount {
    return _tasks.length;
  }

  void addTask(String newTask) {
    final task = Task(name: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
