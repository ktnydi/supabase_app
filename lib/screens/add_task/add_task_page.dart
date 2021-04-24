import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:supabase_app/domains/task/task.dart';
import 'package:supabase_app/repositories/task_repository.dart';
import 'package:supabase_app/screens/add_task/add_task_notifier.dart';
import 'package:supabase_app/screens/add_task/add_task_state.dart';

class AddTask extends StatelessWidget {
  final _nameKey = GlobalKey<FormFieldState<String>>();
  final Task? task;

  AddTask([this.task]);

  Future<void> _update(BuildContext context) async {
    final currentState = _nameKey.currentState;
    if (currentState == null) return;
    if (!currentState.validate()) return;

    try {
      final name = currentState.value ?? '';

      final newTask = task!.copyWith(name: name);

      final addTaskNotifier = context.read<AddTaskNotifier>();

      await addTaskNotifier.updateTask(newTask);

      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _create(BuildContext context) async {
    final currentState = _nameKey.currentState;
    if (currentState == null) return;
    if (!currentState.validate()) return;

    try {
      final name = currentState.value ?? '';

      final addTaskNotifier = context.read<AddTaskNotifier>();

      await addTaskNotifier.addTask(name);

      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _delete(BuildContext context) async {
    try {
      final addTaskNotifier = context.read<AddTaskNotifier>();
      await addTaskNotifier.deleteTask(task!);
      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<AddTaskNotifier, AddTaskState>(
      create: (context) => AddTaskNotifier(
        taskRepository: context.read<TaskRepository>(),
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (task != null)
                IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () async {
                    await _delete(context);
                  },
                ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  key: _nameKey,
                  initialValue: task?.name ?? '',
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return 'タスクをご記入ください。';
                    }

                    return null;
                  },
                  maxLines: 10,
                  minLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '例：Supabaseを学ぶ',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text(task != null ? '更新' : '作成'),
                  onPressed: () async {
                    task != null ? _update(context) : _create(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
