import 'package:built_collection/built_collection.dart';
import '../../data/sale_product/sale_product.dart';
import 'package:meta/meta.dart';

/// addOrReplace will either add or replace the saleProduct in saleProducts
BuiltList<SaleProduct> addOrReplace({
  @required BuiltList<SaleProduct> saleProducts,
  @required SaleProduct saleProduct,
  int providedIndex,
}) {
  assert(saleProducts != null);
  assert(saleProduct != null);

  final int possibleIndex = providedIndex ??
      saleProducts.indexWhere(
        (element) => element.product.id == saleProduct.product.id,
      );

  if (possibleIndex == -1) {
    return (saleProducts.toBuilder()..add(saleProduct)).build();
  } else {
    return (saleProducts.toBuilder()
          ..replaceRange(
            possibleIndex,
            possibleIndex + 1,
            [saleProduct],
          ))
        .build();
  }
}
