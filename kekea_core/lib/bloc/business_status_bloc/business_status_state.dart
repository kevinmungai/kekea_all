import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/business/business.dart';

part 'business_status_state.freezed.dart';

@freezed
abstract class BusinessStatusState with _$BusinessStatusState {
  const factory BusinessStatusState.present({
    @required Business business,
  }) = _Present;
  const factory BusinessStatusState.absent() = _Absent;
}
