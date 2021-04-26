import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase/supabase.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    User? user,
  }) = _UserState;
}
