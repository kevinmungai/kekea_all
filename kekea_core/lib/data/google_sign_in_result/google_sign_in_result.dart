import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../kekea_user/kekea_user.dart';

part 'google_sign_in_result.freezed.dart';

@freezed
abstract class GoogleSignInResult with _$GoogleSignInResult {
  const factory GoogleSignInResult.success({
    @required KekeaUser kekeaUser,
  }) = _Success;
  const factory GoogleSignInResult.failure() = _Failure;
}
