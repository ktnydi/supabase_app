import 'package:state_notifier/state_notifier.dart';
import 'package:supabase_app/notifiers/user_notifier/user_state.dart';
import 'package:supabase_app/repositories/user_repository.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier({
    required UserRepository userRepository,
  })   : _userRepository = userRepository,
        super(UserState());

  final UserRepository _userRepository;

  Future<void> signIn(String email, String password) async {
    final user = await _userRepository.signIn(email, password);
    state = state.copyWith(user: user);
  }

  Future<void> signUp(String email, String password) async {
    final user = await _userRepository.signUp(email, password);
    state = state.copyWith(user: user);
  }
}
