import 'package:flutter/material.dart';
import 'package:kekea_merchant/ui/sale/cancel_sale.dart';
import 'package:kekea_merchant/ui/sale/sale_total_widget.dart';
import 'package:kekea_merchant/ui/sale/selected_products_toggle.dart';

class SaleActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SaleTotalWidget(),
        Row(
          children: [
            SelectedProductsToggle(),
            CancelSale(),
          ],
        ),
      ],
    );
  }
}
