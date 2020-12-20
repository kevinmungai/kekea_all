import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kekea_user.freezed.dart';
part 'kekea_user.g.dart';

@freezed
abstract class KekeaUser with _$KekeaUser {
  const factory KekeaUser({
    @required String id,
    String displayName,
    String photoUrl,
    String phoneNumber,
    String email,
  }) = _KekeaUser;

  factory KekeaUser.fromJson(Map<String, dynamic> json) =>
      _$KekeaUserFromJson(json);
}
