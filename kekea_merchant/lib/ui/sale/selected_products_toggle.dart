import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';

class SelectedProductsToggle extends StatelessWidget {
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
            final ready = selectedProducts.isNotEmpty;
            return IconButton(
              icon: Icon(
                showSelected ? Icons.filter_list : Icons.blur_on,
              ),
              onPressed: ready
                  ? () {
                      BlocProvider.of<ProductListStatusBloc>(context).add(
                        ProductListStatusEvent.toggleSelected(),
                      );
                    }
                  : null,
            );
          },
          loading: () {
            return IconButton(
              icon: Icon(
                Icons.filter_list,
              ),
              onPressed: null,
            );
          },
        );
      },
    );
  }
}
