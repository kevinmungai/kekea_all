import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/data/price/price.dart';
import '../../../lib/data/product/product.dart';
import '../../../lib/data/sale_product/sale_product.dart';
import '../../../lib/utils/sale_product_utils/get_sale_totals.dart';

void main() {
  final SaleProduct one = SaleProduct(
    product: Product(
      id: "1",
      price: Price(
        amount: BigInt.from(20),
      ),
    ),
    quantity: 2,
  );
  final SaleProduct two = SaleProduct(
    product: Product(
      id: "2",
      price: Price(
        amount: BigInt.from(100),
      ),
    ),
    quantity: 4,
  );
  final BuiltList<SaleProduct> empty = BuiltList<SaleProduct>([]);
  final BuiltList<SaleProduct> solo = BuiltList<SaleProduct>([two]);
  final BuiltList<SaleProduct> saleProducts =
      BuiltList<SaleProduct>([one, two]);
  test("testing empty list", () {
    expect(getSaleTotals(saleProducts: empty), equals(BigInt.zero));
  });

  test("testing solo list", () {
    expect(getSaleTotals(saleProducts: solo), equals(BigInt.from(400)));
  });

  test("testing more than one", () {
    expect(getSaleTotals(saleProducts: saleProducts), equals(BigInt.from(440)));
  });

  test("testing null value passed", () {
    expect(
      () {
        getSaleTotals(saleProducts: null);
      },
      throwsAssertionError,
    );
  });
}
