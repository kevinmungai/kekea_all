import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_in_event.freezed.dart';

@freezed
abstract class SignInEvent with _$SignInEvent {
  const factory SignInEvent.signIn() = _SignIn;
  const factory SignInEvent.signOut() = _SignOut;
}
