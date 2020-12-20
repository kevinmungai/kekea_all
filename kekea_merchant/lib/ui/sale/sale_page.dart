import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/create_product/create_product_page.dart';
import 'package:kekea_merchant/ui/sale/sale_actions.dart';
import 'package:kekea_merchant/ui/sale/sale_list.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: SaleActions(),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 4, right: 4, top: 16),
          sliver: SaleList(),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 52, bottom: 84),
          sliver: SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: ElevatedButton(
                child: Text("ADD PRODUCTS"),
                onPressed: () {
                  pushNewScreen(
                    context,
                    screen: CreateProductPage(),
                    withNavBar: true,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
