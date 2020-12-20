import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_product_bloc/bloc.dart';
import 'package:kekea_core/data/edit_product/edit_product.dart';
import 'package:kekea_core/formatters/currency_input_formatter.dart';
import 'package:kekea_core/formatters/format_amount.dart';

class EditProductPriceAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductBloc, EditProductState>(
      builder: (context, state) {
        return state.when(
          present: (EditProduct editProduct) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price"),
                TextFormField(
                  initialValue: formatAmount(
                    amount: editProduct.original.price.amount,
                    addCents: true,
                  ),
                  decoration: InputDecoration(
                    hintText: "20.00",
                    helperText: "The Price of the product",
                    suffix: Text("KES"),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String text) {
                    final double amountInDouble = double.tryParse(text) ?? 0.0;
                    final BigInt amount = BigInt.from(amountInDouble * 100);

                    BlocProvider.of<EditProductBloc>(context).add(
                      EditProductEvent.changePriceAmount(
                        amount: amount,
                      ),
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
          },
          absent: () {
            return Visibility(
              visible: false,
              child: Container(),
            );
          },
        );
      },
    );
  }
}
