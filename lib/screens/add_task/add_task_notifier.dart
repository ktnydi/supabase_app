import 'package:state_notifier/state_notifier.dart';
import 'package:supabase_app/domains/task/task.dart';
import 'package:supabase_app/repositories/task_repository.dart';
import 'package:supabase_app/screens/add_task/add_task_state.dart';

class AddTaskNotifier extends StateNotifier<AddTaskState> {
  AddTaskNotifier({required TaskRepository taskRepository})
      : this._taskRepository = taskRepository,
        super(AddTaskState());

  final TaskRepository _taskRepository;

  Future<void> addTask(String name) async {
    await _taskRepository.addTask(name);
  }

  Future<void> updateTask(Task task) async {
    await _taskRepository.updateTask(task);
  }

  Future<void> deleteTask(Task task) async {
    await _taskRepository.deleteTask(task.id);
  }
}
