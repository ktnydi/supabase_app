import 'package:state_notifier/state_notifier.dart';
import 'package:supabase_app/repositories/task_repository.dart';
import 'package:supabase_app/screens/home/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({required TaskRepository taskRepository})
      : this._taskRepository = taskRepository,
        super(HomeState());

  final TaskRepository _taskRepository;

  Future<void> fetchTasks() async {
    final tasks = await _taskRepository.fetchTasks();
    state = state.copyWith(tasks: tasks);
  }
}
