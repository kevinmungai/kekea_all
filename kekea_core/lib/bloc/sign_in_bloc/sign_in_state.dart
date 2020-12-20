import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState.signedOut() = _SignedOut;
  const factory SignInState.pleaseTryAgain() = _PleaseTryAgain;
  const factory SignInState.signedIn(UserCredential userCredential) = _SignedIn;
  const factory SignInState.error() = _ErrorSigningIn;
}
