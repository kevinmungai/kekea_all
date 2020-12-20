import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_merchant/ui/sale/sale_tile.dart';

class SelectedSaleProductList extends StatelessWidget {
  final BuiltList<SaleProduct> selectedSaleProducts;

  const SelectedSaleProductList({
    @required this.selectedSaleProducts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => SaleTile(
          saleProduct: selectedSaleProducts[index],
        ),
        childCount: selectedSaleProducts.length,
      ),
    );
  }
}
