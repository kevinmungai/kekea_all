// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kekea_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KekeaUser _$_$_KekeaUserFromJson(Map json) {
  return _$_KekeaUser(
    id: json['id'] as String,
    displayName: json['displayName'] as String,
    photoUrl: json['photoUrl'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$_$_KekeaUserToJson(_$_KekeaUser instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('photoUrl', instance.photoUrl);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('email', instance.email);
  return val;
}
