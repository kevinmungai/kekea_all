// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekea_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KekeaUser _$_$_KekeaUserFromJson(Map<String, dynamic> json) {
  return _$_KekeaUser(
    id: json['id'] as String,
    displayName: json['displayName'] as String,
    photoUrl: json['photoUrl'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$_$_KekeaUserToJson(_$_KekeaUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
