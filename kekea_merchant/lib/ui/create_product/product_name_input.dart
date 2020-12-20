import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/create_product_bloc/bloc.dart';

class ProductNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Product Name"),
        TextFormField(
          decoration: InputDecoration(
            hintText: "e.g. banana",
            helperText: "the name of your product",
          ),
          onChanged: (String text) {
            BlocProvider.of<CreateProductBloc>(context).add(
              CreateProductEvent.changeName(name: text),
            );
          },
          validator: (String text) => text.isNotEmpty
              ? null
              : "The name of the product cannot be empty",
        ),
      ],
    );
  }
}
