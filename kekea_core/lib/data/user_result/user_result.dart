import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../kekea_user/kekea_user.dart';

part 'user_result.freezed.dart';

@freezed
abstract class UserResult with _$UserResult {
  const factory UserResult.kekeaUser({
    @required KekeaUser kekeaUser,
  }) = _KekeaUser;
  const factory UserResult.absent() = _Absent;
}
