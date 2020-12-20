import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '../business/business.dart';

part 'business_result.freezed.dart';

@freezed
abstract class BusinessResult with _$BusinessResult {
  const factory BusinessResult.present(Business business) = _Present;
  const factory BusinessResult.absent() = _Absent;
}
