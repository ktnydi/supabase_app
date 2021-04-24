import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:supabase_app/repositories/task_repository.dart';
import 'package:supabase_app/screens/add_task/add_task_page.dart';
import 'package:supabase_app/screens/home/home_notifier.dart';
import 'package:supabase_app/screens/home/home_state.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeNotifier, HomeState>(
      create: (context) => HomeNotifier(
        taskRepository: context.read<TaskRepository>(),
      )..fetchTasks(),
      builder: (context, child) {
        final homeNotifier = context.read<HomeNotifier>();
        final homeState = context.watch<HomeState>();

        return Scaffold(
          appBar: AppBar(
            title: Text('ToDo'),
          ),
          body: homeState.tasks.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    final task = homeState.tasks[index];

                    return ListTile(
                      title: Text(
                        task.name,
                        style: TextStyle(
                          decoration:
                              task.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: Checkbox(
                        value: task.isDone,
                        onChanged: (bool? value) {
                          if (value == null) return;
                          final newTask = task.copyWith(isDone: value);
                          final copyTasks = [...homeState.tasks];
                          copyTasks[index] = newTask;
                          homeNotifier
                            ..setTasks(copyTasks)
                            ..updateTask(newTask);
                        },
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTask(task),
                          ),
                        );
                        homeNotifier.fetchTasks();
                      },
                    );
                  },
                  itemCount: homeState.tasks.length,
                )
              : Center(
                  child: Text('タスクはありません。'),
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTask(),
                ),
              );
              homeNotifier.fetchTasks();
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
