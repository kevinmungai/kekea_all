import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'business_member.freezed.dart';
part 'business_member.g.dart';

@freezed
abstract class BusinessMember with _$BusinessMember {
  const factory BusinessMember({
    @required @JsonKey(name: c.businessMemberFirebaseId) String firebaseId,
    @JsonKey(name: c.businessMemberName) String name,
    @JsonKey(name: c.businessMemberEmail) String email,
    @JsonKey(name: c.businessMemberPhone) String phone,
    @JsonKey(name: c.businessMemberId) String id,
  }) = _BusinessMember;

  factory BusinessMember.fromJson(Map<String, dynamic> json) =>
      _$BusinessMemberFromJson(json);
}
