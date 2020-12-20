import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business_member/business_member.dart';

part 'business_member_state.freezed.dart';

@freezed
abstract class BusinessMemberState with _$BusinessMemberState {
  const factory BusinessMemberState.initial() = _Initial;
  const factory BusinessMemberState.updated({
    @required BusinessMember businessMember,
  }) = _BusinessMemberUpdated;
  const factory BusinessMemberState.created({
    @required BusinessMember businessMember,
  }) = _BusinessMemberCreated;
}
