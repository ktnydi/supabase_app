import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'add_task_state.freezed.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState({
    @Default('') String body,
  }) = _AddTaskState;
}
