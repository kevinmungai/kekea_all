// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessPerson _$_$_BusinessPersonFromJson(Map json) {
  return _$_BusinessPerson(
    firebaseId: json['business_person__firebase_id'] as String,
    email: json['business_person__email'] as String,
    name: json['business_person__name'] as String,
    phone: json['business_person__phone'] as String,
    defaultBusiness: json['business_person__default_business'] == null
        ? null
        : Business.fromJson(
            (json['business_person__default_business'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    defaultStore: json['business_person__default_store'] == null
        ? null
        : Store.fromJson((json['business_person__default_store'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$_$_BusinessPersonToJson(_$_BusinessPerson instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('business_person__firebase_id', instance.firebaseId);
  writeNotNull('business_person__email', instance.email);
  writeNotNull('business_person__name', instance.name);
  writeNotNull('business_person__phone', instance.phone);
  writeNotNull(
      'business_person__default_business', instance.defaultBusiness?.toJson());
  writeNotNull(
      'business_person__default_store', instance.defaultStore?.toJson());
  return val;
}
