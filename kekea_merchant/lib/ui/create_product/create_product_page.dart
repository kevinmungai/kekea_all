import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/create_product/product_name_input.dart';
import 'package:kekea_merchant/ui/create_product/product_price_amount_input.dart';
import 'package:kekea_merchant/ui/create_product/product_quantity_input.dart';
import 'package:kekea_merchant/ui/create_product/product_submit_input.dart';

class CreateProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();

    return Form(
      key: _key,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Product"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          children: [
            ProductNameInput(),
            ProductPriceAmountInput(),
            ProductQuantityInput(),
            Center(child: ProductSubmitInput()),
          ],
        ),
      ),
    );
  }
}
