import 'package:supabase_app/domains/task/task.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();
}
