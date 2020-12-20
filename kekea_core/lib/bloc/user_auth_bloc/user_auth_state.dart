import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/kekea_user/kekea_user.dart';

part 'user_auth_state.freezed.dart';

@freezed
abstract class UserAuthState with _$UserAuthState {
  const factory UserAuthState.present({
    @required KekeaUser kekeaUser,
  }) = _Present;
  const factory UserAuthState.absent() = _Absent;
}
