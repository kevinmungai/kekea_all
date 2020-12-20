import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_or_view_payment_bloc/bloc.dart';
import 'package:kekea_core/data/edit_or_view_payment/edit_or_view_payment.dart';
import 'package:kekea_core/data/payment_method/payment_method.dart';
import 'package:kekea_core/formatters/format_amount.dart';

class SaleSoloTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditOrViewPaymentBloc, EditOrViewPaymentState>(
      builder: (context, state) {
        return state.when(
          present: (EditOrViewPayment editOrViewPayment) {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Text(
                        "TOTAL",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            formatAmount(
                              amount: editOrViewPayment.payment.price.amount,
                              addCents: true,
                            ),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text(
                            PaymentMethod.toDisplayTextPayment(
                              editOrViewPayment.payment.paymentMethod,
                            ),
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          absent: () => SliverToBoxAdapter(),
        );
      },
    );
  }
}
