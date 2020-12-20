import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_in_result.freezed.dart';

@freezed
abstract class SignInResult with _$SignInResult {
  const factory SignInResult.success({
    @required UserCredential userCredential,
  }) = _SignInSuccess;

  const factory SignInResult.abortedGoogleSignIn() = _AbortedGoogleSignIn;

  const factory SignInResult.failedToRecoverAuthError() =
      _FailedToRecoverAuthError;

  const factory SignInResult.userRecoverableAuthError() =
      _UserRecoverableAuthError;

  const factory SignInResult.accountExistsWithDifferentCredential() =
      _AccountExistsWithDifferentCredential;

  const factory SignInResult.invalidCredential() = _InvalidCredential;

  const factory SignInResult.operationNotAllowed() = _OperationNotAllowed;

  const factory SignInResult.userDisabled() = _UserDisabled;

  const factory SignInResult.userNotFound() = _UserNotFound;

  const factory SignInResult.wrongPassword() = _WrongPassword;

  const factory SignInResult.invalidVerificationCode() =
      _InvalidVerificationCode;

  const factory SignInResult.invalidVerificationId() = _InvalidVerificationId;

  const factory SignInResult.unknownError() = _UnKnownError;
}
