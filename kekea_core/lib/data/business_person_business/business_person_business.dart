import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../../utils/constants.dart' as c;

part 'business_person_business.freezed.dart';
part 'business_person_business.g.dart';

@freezed
abstract class BusinessPersonBusiness with _$BusinessPersonBusiness {
  const factory BusinessPersonBusiness({
    @required @JsonKey(name: c.businessPersonBusinessId) String id,
    @required @JsonKey(name: c.businessPersonBusinessName) String name,
    @JsonKey(name: c.businessPersonBusinessDefault) String def,
  }) = _BusinessPersonBusiness;

  factory BusinessPersonBusiness.fromJson(Map<String, dynamic> json) =>
      _$BusinessPersonBusinessFromJson(json);
}
