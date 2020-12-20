import 'package:flutter/material.dart';
import 'package:kekea_core/data/payment_method/payment_method.dart';
import 'package:kekea_merchant/ui/checkout/payment_method_widget.dart';

class PaymentMethodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PaymentMethodWidget(
            paymentMethod: PaymentMethod.cash(),
            url: "null",
          ),
          PaymentMethodWidget(
            paymentMethod: PaymentMethod.mpesa(),
            url: "null",
          ),
          PaymentMethodWidget(
            paymentMethod: PaymentMethod.credit(),
            url: "null",
          ),
          PaymentMethodWidget(
            paymentMethod: PaymentMethod.card(),
            url: "null",
          ),
        ],
      ),
    );
  }
}
