import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kekea_core/bloc/create_product_bloc/bloc.dart';
import 'package:kekea_core/formatters/currency_input_formatter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/extensions/string_extensions.dart';

class ProductPriceAmountInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Price"),
        TextFormField(
          decoration: InputDecoration(
            hintText: "20.00",
            helperText: "The Price of the product",
            suffix: Text("KES"),
          ),
          keyboardType: TextInputType.number,
          onChanged: (String text) {
            final BigInt amount =
                BigInt.tryParse(text.getPlainNum()) ?? BigInt.zero;
            BlocProvider.of<CreateProductBloc>(context).add(
              CreateProductEvent.changePriceAmount(amount: amount),
            );
          },
          validator: (String text) =>
              text.isNotEmpty ? null : "The price cannot be empty",
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CurrencyInputFormatter(),
          ],
        ),
      ],
    );
  }
}
