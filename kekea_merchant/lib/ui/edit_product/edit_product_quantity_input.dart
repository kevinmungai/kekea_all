import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_product_bloc/bloc.dart';
import 'package:kekea_core/data/edit_product/edit_product.dart';

class EditProductQuantityInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductBloc, EditProductState>(
      builder: (context, state) {
        return state.when(
          present: (EditProduct editProduct) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quantity"),
                TextFormField(
                  initialValue: editProduct.original.quantity.toString(),
                  decoration: InputDecoration(
                    helperText: "The Quantity of the Product",
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String text) {
                    final int quantity = int.tryParse(text) ?? 0;

                    BlocProvider.of<EditProductBloc>(context).add(
                      EditProductEvent.changeQuantity(
                        quantity: quantity,
                      ),
                    );
                  },
                  validator: (String text) =>
                      text.isNotEmpty ? null : "The quantity cannot be empty",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                )
              ],
            );
          },
          absent: () {
            return Visibility(
              child: Container(),
              visible: false,
            );
          },
        );
      },
    );
  }
}
