import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'link_result.freezed.dart';

@freezed
abstract class LinkResult with _$LinkResult {
  const factory LinkResult.present({
    @required Uri uri,
  }) = _Present;
  const factory LinkResult.absent() = _Absent;
}
