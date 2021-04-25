import 'package:state_notifier/state_notifier.dart';
import 'package:supabase_app/screens/sign_in/sign_in_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier() : super(SignInState());

  void setObscureText(bool obscureText) {
    state = state.copyWith(obscureText: obscureText);
  }
}
