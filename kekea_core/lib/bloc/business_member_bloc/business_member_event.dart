import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business_member/business_member.dart';

part 'business_member_event.freezed.dart';

@freezed
abstract class BusinessMemberEvent with _$BusinessMemberEvent {
  const factory BusinessMemberEvent.create({
    @required String businessId,
    @required BusinessMember businessMember,
  }) = _CreateBusinessMember;
  const factory BusinessMemberEvent.update({
    @required String businessId,
    @required BusinessMember businessMember,
  }) = _UpdateBusinessMember;
}
