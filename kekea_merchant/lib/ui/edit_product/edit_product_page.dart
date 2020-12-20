import 'package:flutter/material.dart';
import 'package:kekea_core/data/product/product.dart';
import 'package:kekea_merchant/ui/edit_product/edit_product_name_input.dart';
import 'package:kekea_merchant/ui/edit_product/edit_product_price_amount_input.dart';
import 'package:kekea_merchant/ui/edit_product/edit_product_quantity_input.dart';
import 'package:kekea_merchant/ui/edit_product/edit_product_submit_input.dart';

class EditProductPage extends StatelessWidget {
  final Product product;

  const EditProductPage({
    @required this.product,
  }) : assert(product != null);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(
        debugLabel: "edit-product-page-form-key",
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("EDIT"),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          children: [
            EditProductNameInput(),
            EditProductPriceAmount(),
            EditProductQuantityInput(),
            Center(
              child: EditProductSubmitInput(),
            )
          ],
        ),
      ),
    );
  }
}
