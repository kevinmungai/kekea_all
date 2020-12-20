import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business/business.dart';

part 'business_event.freezed.dart';

@freezed
abstract class BusinessEvent with _$BusinessEvent {
  const factory BusinessEvent.updateBusiness({
    @required Business business,
  }) = _UpdateBusiness;
}
