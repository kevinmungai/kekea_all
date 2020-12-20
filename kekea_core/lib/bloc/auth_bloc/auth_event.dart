import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.listenToAuthChanges() = _Listen;
  const factory AuthEvent.setPresent(User user) = _SetPresent;
  const factory AuthEvent.setAbsent() = _SetAbsent;
  const factory AuthEvent.setError() = _SetError;
}
