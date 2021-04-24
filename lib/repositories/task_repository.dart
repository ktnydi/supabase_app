import 'package:supabase_app/domains/task/task.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();
  Future<void> updateTask(Task task);
  Future<void> addTask(String name);
  Future<void> deleteTask(int taskId);
}
