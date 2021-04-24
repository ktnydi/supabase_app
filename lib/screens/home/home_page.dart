import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:supabase_app/repositories/task_repository.dart';
import 'package:supabase_app/screens/home/home_notifier.dart';
import 'package:supabase_app/screens/home/home_state.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeNotifier, HomeState>(
      create: (context) => HomeNotifier(
        taskRepository: context.read<TaskRepository>(),
      ),
      builder: (context, child) {
        final homeNotifier = context.read<HomeNotifier>();
        final homeState = context.watch<HomeState>();

        return Scaffold(
          appBar: AppBar(
            title: Text('ToDo'),
          ),
          body: FutureBuilder(
            future: homeNotifier.fetchTasks(),
            builder: (context, snapshot) {
              final isLoading =
                  snapshot.connectionState == ConnectionState.waiting;

              if (isLoading && !snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }

              return ListView.builder(
                itemBuilder: (context, index) {
                  final task = homeState.tasks[index];

                  return CheckboxListTile(
                    title: Text(task.name),
                    value: task.isDone,
                    onChanged: (bool? value) {
                      // TODO: タスク完了処理
                    },
                  );
                },
                itemCount: homeState.tasks.length,
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // TODO: タスクを追加
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
