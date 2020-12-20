import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:kekea_core/data/product/product.dart';

part 'signal_state.freezed.dart';

@freezed
abstract class SignalState with _$SignalState {
  const factory SignalState.nothing() = _Nothing;
  const factory SignalState.productUpdated(Product product) = _ProductUpdated;
}
