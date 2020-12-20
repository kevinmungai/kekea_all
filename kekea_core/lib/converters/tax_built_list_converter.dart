import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/tax/tax.dart';

class TaxBuiltListConverter implements JsonConverter<BuiltList<Tax>, List> {
  const TaxBuiltListConverter();
  @override
  BuiltList<Tax> fromJson(List ls) {
    ListBuilder<Tax> taxes = BuiltList<Tax>().toBuilder();

    ls?.forEach((e) {
      if (e != null) {
        final Map<String, dynamic> casted = Map<String, dynamic>.from(e);
        if (casted.isNotEmpty) {
          taxes.add(Tax.fromJson(casted));
        }
      }
    });

    return taxes.build();
  }

  @override
  List toJson(BuiltList<Tax> taxes) {
    return taxes?.map((Tax tax) => tax.toJson())?.toList();
  }
}
