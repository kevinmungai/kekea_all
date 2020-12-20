// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessMember _$_$_BusinessMemberFromJson(Map<String, dynamic> json) {
  return _$_BusinessMember(
    firebaseId: json['business_member__firebase_id'] as String,
    name: json['business_member__name'] as String,
    email: json['business_member__email'] as String,
    phone: json['business_member__phone'] as String,
    id: json['business_member__id'] as String,
  );
}

Map<String, dynamic> _$_$_BusinessMemberToJson(_$_BusinessMember instance) =>
    <String, dynamic>{
      'business_member__firebase_id': instance.firebaseId,
      'business_member__name': instance.name,
      'business_member__email': instance.email,
      'business_member__phone': instance.phone,
      'business_member__id': instance.id,
    };
