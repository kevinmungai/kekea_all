import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class StringBuiltListConverter
    implements JsonConverter<BuiltList<String>, List> {
  const StringBuiltListConverter();
  @override
  BuiltList<String> fromJson(List ls) {
    ListBuilder<String> strings = BuiltList<String>().toBuilder();

    ls?.forEach((e) {
      if (e != null) {
        final String casted = e as String;
        if (casted.isNotEmpty) {
          strings.add(casted);
        }
      }
    });

    return strings.build();
  }

  @override
  List toJson(BuiltList<String> strings) {
    return strings?.map((String string) => string)?.toList();
  }
}
