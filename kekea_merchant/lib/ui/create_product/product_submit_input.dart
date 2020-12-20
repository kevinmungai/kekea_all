import 'package:flutter/material.dart';
import 'package:kekea_core/bloc/create_product_bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSubmitInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("SUBMIT"),
      onPressed: () {
        if (Form.of(context).validate()) {
          BlocProvider.of<CreateProductBloc>(context).add(
            CreateProductEvent.createProduct(),
          );
          Navigator.maybePop(context);
        }
      },
    );
  }
}
