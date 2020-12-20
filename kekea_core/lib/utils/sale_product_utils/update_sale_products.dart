import 'package:built_collection/built_collection.dart';
import '../../data/product/product.dart';
import '../../data/sale_product/sale_product.dart';
import 'package:meta/meta.dart';

/// Returns `List<SaleProduct>`s that have been updated by the `List<Product>`
/// from the database.
BuiltList<SaleProduct> updateSaleProduct({
  @required BuiltList<SaleProduct> saleProducts,
  @required BuiltList<Product> products,
}) {
  assert(saleProducts != null);
  assert(products != null);

  ListBuilder<SaleProduct> res = BuiltList<SaleProduct>([]).toBuilder();
  ListBuilder<Product> productsTemp = products.toBuilder();

  saleProducts.forEach(
    (SaleProduct saleProduct) {
      final int index = productsTemp.build().indexWhere(
            (product) => product.id == saleProduct.product.id,
          );

      if (index == -1) {
        res.add(saleProduct);
      } else {
        res.add(
          modifySaleProduct(
            saleProduct: saleProduct,
            product: productsTemp[index],
          ),
        );
        productsTemp.removeAt(index);
      }
    },
  );

  productsTemp.build().forEach((Product product) {
    res.add(SaleProduct(quantity: 0, product: product));
  });

  return res.build();
}

SaleProduct modifySaleProduct({
  @required SaleProduct saleProduct,
  @required Product product,
}) {
  assert(saleProduct != null);
  assert(product != null);

  return saleProduct.quantity > product.quantity
      ? saleProduct.copyWith(quantity: product.quantity, product: product)
      : saleProduct.copyWith(product: product);
}

BuiltList<SaleProduct> getSelectedSaleProducts({
  @required BuiltList<SaleProduct> saleProducts,
}) {
  assert(saleProducts != null);

  return saleProducts
      .where((saleProduct) => saleProduct.quantity > 0)
      .toBuiltList();
}
