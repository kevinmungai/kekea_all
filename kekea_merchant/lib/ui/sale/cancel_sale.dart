import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';

class CancelSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListStatusBloc, ProductListStatusState>(
      builder: (context, state) {
        return state.when(
          present: (
            BuiltList<SaleProduct> saleProducts,
            BuiltList<SaleProduct> selectedProducts,
            bool showSelected,
          ) {
            return IconButton(
              icon: Icon(Icons.clear),
              onPressed: selectedProducts.isEmpty
                  ? null
                  : () {
                      BlocProvider.of<ProductListStatusBloc>(context).add(
                        ProductListStatusEvent.cancel(),
                      );
                    },
            );
          },
          loading: () {
            return IconButton(
              icon: Icon(Icons.clear),
              onPressed: null,
            );
          },
        );
      },
    );
  }
}
