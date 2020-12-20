import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/store/products_tile.dart';
import 'package:kekea_merchant/ui/store/sales_tile.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text("LOCATION DETAILS"),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: ProductsTile(),
        ),
        SliverToBoxAdapter(child: Divider()),
        SliverToBoxAdapter(
          child: SalesTile(),
        ),
      ],
    );
  }
}
