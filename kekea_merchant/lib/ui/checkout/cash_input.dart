import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/payment_input_bloc/bloc.dart';
import 'package:kekea_core/formatters/currency_input_formatter.dart';
import 'package:kekea_core/extensions/string_extensions.dart';

class CashInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                "AMOUNT:",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: TextFormField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "0.00",
              contentPadding: const EdgeInsets.all(0),
            ),
            keyboardType: TextInputType.number,
            onChanged: (String text) {
              final BigInt amount =
                  BigInt.tryParse(text.getPlainNum()) ?? BigInt.zero;
              BlocProvider.of<PaymentInputBloc>(context).add(
                PaymentInputEvent.changeCashAmountGiven(
                  amountGiven: amount,
                ),
              );
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(),
            ],
            textAlign: TextAlign.end,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }
}
