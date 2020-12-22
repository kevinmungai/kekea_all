import 'package:flutter/material.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_method/payment_method.dart';
import 'package:kekea_core/formatters/date_formatter.dart';
import 'package:kekea_core/formatters/format_amount.dart';

class ReceiptPaymentWidget extends StatelessWidget {
  final Payment payment;

  const ReceiptPaymentWidget({
    @required this.payment,
  }) : assert(payment != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          payment.business.name != null
              ? payment.business.name
              : payment.business.id,
          style: Theme.of(context).textTheme.headline5.copyWith(
                fontSize: 20,
              ),
        ),
        Text(
          payment.store.name != null ? payment.store.name : payment.store.id,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          getDateFormat(payment.timestamp.toDate()),
          style: Theme.of(context).textTheme.caption,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: formatAmount(
                  amount: payment.price.amount,
                  addCents: true,
                ),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              TextSpan(text: " "),
              TextSpan(
                text: PaymentMethod.toDisplayTextPayment(
                  payment.paymentMethod,
                ),
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
