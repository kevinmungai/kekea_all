import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';

class SelectQuantity extends StatelessWidget {
  final SaleProduct saleProduct;
  final Key key;

  const SelectQuantity({
    @required this.saleProduct,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          padding: const EdgeInsets.all(4),
          icon: Icon(
            Icons.remove_circle,
            size: 38,
          ),
          onPressed: () {
            BlocProvider.of<ProductListStatusBloc>(context).add(
              ProductListStatusEvent.minusSaleQuantity(
                saleProduct: saleProduct,
              ),
            );
          },
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: saleProduct.quantity.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
              TextSpan(
                text: " / ",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextSpan(
                text: saleProduct.product.quantity.toString(),
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
        IconButton(
          padding: const EdgeInsets.all(4),
          icon: Icon(
            Icons.add_circle,
            size: 38,
          ),
          onPressed: () {
            BlocProvider.of<ProductListStatusBloc>(context).add(
              ProductListStatusEvent.addSaleQuantity(
                saleProduct: saleProduct,
              ),
            );
          },
        ),
      ],
    );
  }
}
