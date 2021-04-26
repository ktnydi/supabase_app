import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:supabase_app/implements/task_repository_impl.dart';
import 'package:supabase_app/implements/user_repository_impl.dart';
import 'package:supabase_app/repositories/task_repository.dart';
import 'package:supabase_app/repositories/user_repository.dart';
import 'package:supabase_app/screens/my_app/my_app_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<TaskRepository>(create: (_) => TaskRepositoryImpl()),
        Provider<UserRepository>(create: (_) => UserRepositoryImpl()),
      ],
      child: MyApp(),
    ),
  );
}
