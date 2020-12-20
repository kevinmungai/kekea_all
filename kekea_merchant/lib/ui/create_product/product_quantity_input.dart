import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/create_product_bloc/bloc.dart';

class ProductQuantityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quantity"),
        TextFormField(
          decoration: InputDecoration(
            helperText: "The Quantity of the Product",
          ),
          keyboardType: TextInputType.number,
          onChanged: (String text) {
            final int quantity = int.tryParse(text) ?? 0;
            BlocProvider.of<CreateProductBloc>(context).add(
              CreateProductEvent.changeQuantity(quantity: quantity),
            );
          },
          validator: (String text) =>
              text.isNotEmpty ? null : "The quantity cannot be empty",
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ],
    );
  }
}
