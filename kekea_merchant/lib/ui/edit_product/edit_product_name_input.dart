import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_product_bloc/bloc.dart';
import 'package:kekea_core/data/edit_product/edit_product.dart';

class EditProductNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProductBloc, EditProductState>(
      builder: (context, state) {
        return state.when(
          present: (EditProduct editProduct) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Name"),
                TextFormField(
                  initialValue: editProduct.original.name,
                  decoration: InputDecoration(
                    hintText: "e.g. banana",
                    helperText: "the name of your product",
                  ),
                  onChanged: (String text) {
                    BlocProvider.of<EditProductBloc>(context).add(
                      EditProductEvent.changeName(
                        name: text,
                      ),
                    );
                  },
                  validator: (String text) => text.isNotEmpty
                      ? null
                      : "The name of the product cannot be empty",
                ),
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
