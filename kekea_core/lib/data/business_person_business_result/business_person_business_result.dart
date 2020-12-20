import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../business_person_business/business_person_business.dart';

part 'business_person_business_result.freezed.dart';

@freezed
abstract class BusinessPersonBusinessResult
    with _$BusinessPersonBusinessResult {
  const factory BusinessPersonBusinessResult.present({
    @required BusinessPersonBusiness businessPersonBusiness,
  }) = _Present;
  const factory BusinessPersonBusinessResult.absent() = _Absent;
}
