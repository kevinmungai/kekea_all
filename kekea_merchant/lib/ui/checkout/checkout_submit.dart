import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/payment_input_bloc/bloc.dart';

class CheckOutSubmit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.done_all),
      onPressed: () {
        BlocProvider.of<PaymentInputBloc>(context).add(
          PaymentInputEvent.submit(),
        );
        Navigator.maybePop(context);
      },
    );
  }
}
