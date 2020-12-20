import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_out_result.freezed.dart';

@freezed
abstract class SignOutResult with _$SignOutResult {
  const factory SignOutResult.success() = _SignOutSuccess;
  const factory SignOutResult.failure() = _SignOutFailure;
}
