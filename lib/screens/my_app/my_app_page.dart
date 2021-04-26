import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:supabase_app/notifiers/user_notifier/user_notifier.dart';
import 'package:supabase_app/notifiers/user_notifier/user_state.dart';
import 'package:supabase_app/repositories/user_repository.dart';
import 'package:supabase_app/screens/sign_in/sign_in_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<UserNotifier, UserState>(
      create: (context) => UserNotifier(
        userRepository: context.read<UserRepository>(),
      ),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SignIn(),
        );
      },
    );
  }
}
