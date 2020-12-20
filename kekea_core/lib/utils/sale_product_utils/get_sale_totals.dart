import 'package:built_collection/built_collection.dart';
import '../../data/sale_product/sale_product.dart';
import 'package:meta/meta.dart';

BigInt getSaleTotals({
  @required BuiltList<SaleProduct> saleProducts,
}) {
  assert(saleProducts != null);

  return saleProducts.fold(
    BigInt.zero,
    (BigInt previousValue, SaleProduct element) {
      final BigInt discountAmount = element?.discount?.price?.amount;

      if (discountAmount != null) {
        if (discountAmount > BigInt.zero) {
          return previousValue +
              (discountAmount * BigInt.from(element.quantity));
        }
      }

      return previousValue +
          (element.product.price.amount * BigInt.from(element.quantity));
    },
  );
}
