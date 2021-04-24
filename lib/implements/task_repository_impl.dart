import 'package:supabase/supabase.dart';
import 'package:supabase_app/config.dart';
import 'package:supabase_app/domains/task/task.dart';
import 'package:supabase_app/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final _client = SupabaseClient(
    config['supabaseUrl']!,
    config['supabaseKey']!,
  );

  @override
  Future<List<Task>> fetchTasks() async {
    final response =
        await _client.from('tasks').select('*').order('id').execute();

    final error = response.error;
    if (error != null) {
      throw (error.message);
    }

    // Map<String, dynamic>型のリスト
    final data = response.data as List<dynamic>;

    return data.map((json) => Task.fromJson(json)).toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    final response = await _client
        .from('tasks')
        .update(task.toJson())
        .eq('id', task.id)
        .execute();

    final error = response.error;
    if (error != null) {
      throw (error.message);
    }
  }

  @override
  Future<void> addTask(String name) async {
    final response =
        await _client.from('tasks').insert({'name': name}).execute();

    final error = response.error;
    if (error != null) {
      throw (error.message);
    }
  }

  @override
  Future<void> deleteTask(int taskId) async {
    final response =
        await _client.from('tasks').delete().eq('id', taskId).execute();

    final error = response.error;
    if (error != null) {
      throw (error.message);
    }
  }
}
