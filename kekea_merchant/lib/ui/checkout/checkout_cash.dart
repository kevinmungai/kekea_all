import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/payment_input_bloc/bloc.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/utils/colors.dart';

import 'package:kekea_merchant/ui/checkout/cash_input.dart';
import 'package:kekea_merchant/ui/checkout/cash_total.dart';

class CheckOutCash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentInputBloc, PaymentInputState>(
      builder: (context, state) {
        return state.paymentMethod.maybeWhen(
          cash: (BigInt amountGiven, BigInt total, BigInt change) => Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Calculate change...",
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CashInput(),
                        SizedBox(height: 12),
                        CashTotal(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 32),
                                  child: Text(
                                    "CHANGE:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                          color: spanishGray,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    formatAmount(
                                      amount: change ?? BigInt.zero,
                                      addCents: true,
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                          color: spanishGray,
                                        ),
                                  ),
                                  Divider(
                                    color: silverSand,
                                    thickness: 0.7,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          orElse: () => Visibility(
            visible: false,
            child: Container(),
          ),
        );
      },
    );
  }
}
