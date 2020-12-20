import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/create_product/create_product_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AddNewProductButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ExtendedNavigator.named("product-list-navigator").push(
        //   product_router.Routes.createProductPage,
        // );
        pushNewScreen(
          context,
          screen: CreateProductPage(),
        );
      },
      child: Material(
        color: Color(0xff00007a),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 8,
            left: 2,
          ),
          child: Row(
            children: [
              Icon(Icons.add),
              SizedBox(width: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                  children: [
                    TextSpan(text: "NEW\n"),
                    TextSpan(text: "PRODUCT"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
