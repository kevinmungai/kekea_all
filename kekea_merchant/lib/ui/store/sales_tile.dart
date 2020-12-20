import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/sale_list/sale_list_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SalesTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Sales"),
      onTap: () {
        pushNewScreen(
          context,
          screen: SaleListPage(),
        );
      },
    );
  }
}
