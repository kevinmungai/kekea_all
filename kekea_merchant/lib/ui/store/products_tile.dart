import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/product_list/product_list_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ProductsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Products"),
      onTap: () {
        pushNewScreen(
          context,
          screen: ProductListPage(),
        );
      },
    );
  }
}
