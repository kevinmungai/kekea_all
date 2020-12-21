import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/data/product/product.dart';
import '../../../lib/data/sale_product/sale_product.dart';
import '../../../lib/utils/sale_product_utils/update_sale_products.dart';

void main() {
  final SaleProduct saleProduct1 = SaleProduct(
    quantity: 2,
    product: Product(
      id: "1",
      quantity: 5,
    ),
  );

  final Product product1 = Product(
    id: "1",
    quantity: 3,
  );

  final SaleProduct result1 = SaleProduct(
    quantity: 2,
    product: Product(
      id: "1",
      quantity: 3,
    ),
  );

  final SaleProduct saleProduct2 = SaleProduct(
    quantity: 3,
    product: Product(
      id: "2",
      quantity: 8,
    ),
  );

  final Product product2 = Product(
    id: "2",
    quantity: 2,
  );

  final SaleProduct result2 = SaleProduct(
    quantity: 2,
    product: Product(
      id: "2",
      quantity: 2,
    ),
  );

  final BuiltList<SaleProduct> saleProducts1 =
      BuiltList<SaleProduct>([saleProduct1]);
  final BuiltList<Product> products2 = BuiltList<Product>([product2]);
  final BuiltList<SaleProduct> res1 = BuiltList<SaleProduct>([
    saleProduct1,
    SaleProduct(
      quantity: 0,
      product: product2,
    ),
  ]);

  test("possiblyModify sale saleProduct.quantity < product.quantity", () {
    expect(
      modifySaleProduct(saleProduct: saleProduct1, product: product1),
      equals(result1),
    );
  });

  test("possiblyModify sale saleProduct.quantity > product.quantity", () {
    expect(
      modifySaleProduct(saleProduct: saleProduct2, product: product2),
      equals(result2),
    );
  });

  test("updateSaleProduct where product does not exist", () {
    expect(
      updateSaleProduct(saleProducts: saleProducts1, products: products2),
      equals(res1),
    );
  });

  test("updateSaleProduct one item", () {
    final BuiltList<SaleProduct> saleProducts = updateSaleProduct(
      saleProducts: BuiltList<SaleProduct>([
        SaleProduct(
          product: Product(
            id: "1",
            quantity: 5,
          ),
          quantity: 2,
        ),
      ]),
      products: BuiltList<Product>([
        Product(
          id: "1",
          quantity: 3,
        ),
      ]),
    );
    expect(
        saleProducts,
        equals(BuiltList<SaleProduct>([
          SaleProduct(
            product: Product(
              id: "1",
              quantity: 3,
            ),
            quantity: 2,
          ),
        ])));
  });

  test("updateSaleProduct two items", () {
    final BuiltList<SaleProduct> saleProducts = updateSaleProduct(
      saleProducts: BuiltList<SaleProduct>([
        SaleProduct(
          product: Product(
            id: "1",
            quantity: 8,
          ),
          quantity: 4,
        ),
        SaleProduct(
          product: Product(
            id: "2",
            quantity: 9,
          ),
          quantity: 5,
        ),
      ]),
      products: BuiltList<Product>([
        Product(
          id: "1",
          quantity: 3,
        ),
      ]),
    );

    expect(
        saleProducts,
        equals(BuiltList<SaleProduct>([
          SaleProduct(
            product: Product(
              id: "1",
              quantity: 3,
            ),
            quantity: 3,
          ),
          SaleProduct(
            product: Product(
              id: "2",
              quantity: 9,
            ),
            quantity: 5,
          ),
        ])));
  });

  test("updateSaleProducts two items", () {
    final BuiltList<SaleProduct> saleProducts = updateSaleProduct(
      saleProducts: BuiltList<SaleProduct>([
        SaleProduct(
          product: Product(
            id: "1",
            quantity: 8,
          ),
          quantity: 4,
        ),
        SaleProduct(
          product: Product(
            id: "2",
            quantity: 9,
          ),
          quantity: 5,
        ),
      ]),
      products: BuiltList<Product>([
        Product(
          id: "1",
          quantity: 2,
        ),
        Product(
          id: "2",
          quantity: 3,
        ),
      ]),
    );

    final BuiltList<SaleProduct> result = BuiltList<SaleProduct>([
      SaleProduct(
        product: Product(
          id: "1",
          quantity: 2,
        ),
        quantity: 2,
      ),
      SaleProduct(
        product: Product(
          id: "2",
          quantity: 3,
        ),
        quantity: 3,
      ),
    ]);

    expect(saleProducts, equals(result));
  });

  test("updateSaleProduct two items one", () {
    final BuiltList<SaleProduct> saleProducts = updateSaleProduct(
      saleProducts: BuiltList<SaleProduct>([
        SaleProduct(
          product: Product(
            id: "1",
            quantity: 8,
          ),
          quantity: 4,
        ),
        SaleProduct(
          product: Product(
            id: "2",
            quantity: 9,
          ),
          quantity: 5,
        ),
      ]),
      products: BuiltList<Product>([
        Product(
          id: "1",
          quantity: 2,
        ),
        Product(
          id: "2",
          quantity: 3,
        ),
        Product(
          id: "8",
          quantity: 89,
        ),
      ]),
    );

    final BuiltList<SaleProduct> result = BuiltList<SaleProduct>([
      SaleProduct(
        product: Product(
          id: "1",
          quantity: 2,
        ),
        quantity: 2,
      ),
      SaleProduct(
        product: Product(
          id: "2",
          quantity: 3,
        ),
        quantity: 3,
      ),
      SaleProduct(
        product: Product(
          id: "8",
          quantity: 89,
        ),
        quantity: 0,
      ),
    ]);

    expect(saleProducts, equals(result));
  });
}
