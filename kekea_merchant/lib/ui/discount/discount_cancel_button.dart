import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';

class DiscountCancelButton extends StatelessWidget {
  final String productId;

  const DiscountCancelButton({
    @required this.productId,
  }) : assert(productId != null);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        Navigator.maybePop(context);
        BlocProvider.of<ProductListStatusBloc>(context).add(
          ProductListStatusEvent.cancelDiscount(
            productId: productId,
          ),
        );
      },
    );
  }
}
