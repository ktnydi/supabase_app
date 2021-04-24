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
    final response = await _client.from('tasks').select('*').execute();

    final error = response.error;
    if (error != null) {
      throw (error.message);
    }

    // Map<String, dynamic>型のリスト
    final data = response.data as List<dynamic>;

    return data.map((json) => Task.fromJson(json)).toList();
  }
}
