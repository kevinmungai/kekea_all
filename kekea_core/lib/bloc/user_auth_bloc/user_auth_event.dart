import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../data/kekea_user/kekea_user.dart';

part 'user_auth_event.freezed.dart';

@freezed
abstract class UserAuthEvent with _$UserAuthEvent {
  const factory UserAuthEvent.listen() = _Listen;
  const factory UserAuthEvent.signInViaGoogle() = _SignInViaGoogle;
  const factory UserAuthEvent.signOut() = _SignOut;
  const factory UserAuthEvent.setPresent({
    @required KekeaUser kekeaUser,
  }) = _SetPresent;
  const factory UserAuthEvent.setAbsent() = _SetAbsent;
}
