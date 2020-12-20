import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/edit_product_bloc/bloc.dart';

class EditProductSubmitInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("SUBMIT"),
      onPressed: () {
        Navigator.maybePop(context);
        if (Form.of(context).validate()) {
          BlocProvider.of<EditProductBloc>(context).add(
            EditProductEvent.submit(),
          );
        }
      },
    );
  }
}
