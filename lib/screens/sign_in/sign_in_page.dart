import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:supabase_app/notifiers/user_notifier/user_notifier.dart';
import 'package:supabase_app/screens/home/home_page.dart';
import 'package:supabase_app/screens/sign_in/sign_in_notifier.dart';
import 'package:supabase_app/screens/sign_in/sign_in_state.dart';

class SignIn extends StatelessWidget {
  final _emailKey = GlobalKey<FormFieldState<String>>();
  final _passwordKey = GlobalKey<FormFieldState<String>>();

  Future<void> _signIn(BuildContext context) async {
    final emailState = _emailKey.currentState;
    final passwordState = _passwordKey.currentState;
    if (emailState == null || passwordState == null) return;

    if (!emailState.validate() || !passwordState.validate()) return;

    final userNotifier = context.read<UserNotifier>();

    try {
      final email = emailState.value;
      final password = passwordState.value;
      if (email == null || password == null) return;

      await userNotifier.signIn(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signUp(BuildContext context) async {
    final emailState = _emailKey.currentState;
    final passwordState = _passwordKey.currentState;
    if (emailState == null || passwordState == null) return;

    if (!emailState.validate() || !passwordState.validate()) return;

    final userNotifier = context.read<UserNotifier>();

    try {
      final email = emailState.value;
      final password = passwordState.value;
      if (email == null || password == null) return;

      await userNotifier.signUp(email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SignInNotifier, SignInState>(
      create: (_) => SignInNotifier(),
      builder: (context, child) {
        final signInNotifier = context.read<SignInNotifier>();
        final signInState = context.watch<SignInState>();

        return Scaffold(
          appBar: AppBar(
            title: Text('????????????'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  key: _emailKey,
                  validator: (value) {
                    if (value == null) {
                      return '????????????????????????????????????????????????';
                    }

                    if (value.trim().isEmpty) {
                      return '????????????????????????????????????????????????';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '?????????????????????',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  key: _passwordKey,
                  validator: (value) {
                    if (value == null) {
                      return '??????????????????????????????????????????';
                    }

                    if (value.trim().isEmpty) {
                      return '??????????????????????????????????????????';
                    }

                    return null;
                  },
                  obscureText: signInState.obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '???????????????',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye_outlined),
                      onPressed: () {
                        signInNotifier.setObscureText(
                          !signInState.obscureText,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text('????????????'),
                  onPressed: () async {
                    await _signIn(context);
                  },
                ),
                SizedBox(height: 16),
                TextButton(
                  child: Text('?????????????????????'),
                  onPressed: () async {
                    await _signUp(context);
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
