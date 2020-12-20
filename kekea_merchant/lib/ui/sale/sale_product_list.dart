import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_merchant/ui/sale/sale_tile.dart';

class SaleProductList extends StatelessWidget {
  final BuiltList<SaleProduct> saleProducts;

  const SaleProductList({
    @required this.saleProducts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => SaleTile(
          saleProduct: saleProducts[index],
        ),
        childCount: saleProducts.length,
      ),
    );
  }
}
