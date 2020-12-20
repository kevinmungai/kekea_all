import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business/business.dart';

part 'business_status_event.freezed.dart';

@freezed
abstract class BusinessStatusEvent with _$BusinessStatusEvent {
  const factory BusinessStatusEvent.listen({
    @required String businessId,
  }) = _Listen;
  const factory BusinessStatusEvent.setPresent({
    @required Business business,
  }) = _SetPresent;
  const factory BusinessStatusEvent.setAbsent() = _SetAbsent;
  const factory BusinessStatusEvent.setError() = _SetError;
}
