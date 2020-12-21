import 'package:flutter/material.dart';
import 'package:kekea_core/data/payment/payment.dart';
import 'package:kekea_core/data/payment_method/payment_method.dart';
import 'package:kekea_core/formatters/date_formatter.dart';
import 'package:kekea_core/formatters/format_amount.dart';

class ReceiptListTile extends StatelessWidget {
  final Payment payment;

  const ReceiptListTile({
    @required this.payment,
  }) : assert(payment != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Material(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            children: [
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Text(
                      getDateFormat(payment.timestamp.toDate()),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      payment.business.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      payment.store.name,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      payment.id,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Text(
                      formatAmount(amount: payment.price.amount),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      PaymentMethod.toDisplayTextPayment(
                        payment.paymentMethod,
                      ),
                      style: Theme.of(context).textTheme.caption,
                    ),
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
