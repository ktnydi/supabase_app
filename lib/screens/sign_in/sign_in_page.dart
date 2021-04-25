import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
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

    try {
      // TODO: ログイン
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

    try {
      // TODO: アカウント作成
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
            title: Text('ログイン'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  key: _emailKey,
                  validator: (value) {
                    if (value == null) {
                      return 'メールアドレスをご記入ください。';
                    }

                    if (value.trim().isEmpty) {
                      return 'メールアドレスをご記入ください。';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'メールアドレス',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  key: _passwordKey,
                  validator: (value) {
                    if (value == null) {
                      return 'パスワードをご記入ください。';
                    }

                    if (value.trim().isEmpty) {
                      return 'パスワードをご記入ください。';
                    }

                    return null;
                  },
                  obscureText: signInState.obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'パスワード',
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
                  child: Text('ログイン'),
                  onPressed: () async {
                    await _signIn(context);
                  },
                ),
                SizedBox(height: 16),
                TextButton(
                  child: Text('アカウント作成'),
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
