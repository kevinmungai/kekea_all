import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/create_product/create_product_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class EmptySalePage extends StatelessWidget {
  const EmptySalePage();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text("ADD PRODUCTS"),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CreateProductPage(),
          //   ),
          // );
          pushNewScreen(
            context,
            screen: CreateProductPage(),
          );
        },
      ),
    );
  }
}
