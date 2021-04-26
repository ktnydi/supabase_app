import 'package:supabase/supabase.dart';

abstract class UserRepository {
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(String email, String password);
}
