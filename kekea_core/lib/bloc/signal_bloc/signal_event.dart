import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/product/product.dart';

part 'signal_event.freezed.dart';

@freezed
abstract class SignalEvent with _$SignalEvent {
  const factory SignalEvent.productUpdated(Product product) = _ProductUpdated;
}
