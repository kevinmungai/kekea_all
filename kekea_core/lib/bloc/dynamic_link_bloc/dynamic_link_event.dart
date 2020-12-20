import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'dynamic_link_event.freezed.dart';

@freezed
abstract class DynamicLinkEvent with _$DynamicLinkEvent {
  const factory DynamicLinkEvent.checkForLink() = _CheckForLink;
}
