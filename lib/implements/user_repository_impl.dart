import 'package:gotrue/src/user.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_app/config.dart';
import 'package:supabase_app/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final _client = SupabaseClient(
    config['supabaseUrl']!,
    config['supabaseKey']!,
  );

  @override
  Future<User?> signIn(String email, String password) async {
    final response = await _client.auth.signIn(
      email: email,
      password: password,
    );

    final error = response.error;
    if (error != null) {
      throw (error.message);
    }

    return response.user;
  }

  @override
  Future<User?> signUp(String email, String password) async {
    final response = await _client.auth.signUp(
      email,
      password,
    );

    final error = response.error;
    if (error != null) {
      throw (error.message);
    }

    return response.user;
  }
}
