import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_merchant/ui/sale/empty_sale_page.dart';
import 'package:kekea_merchant/ui/sale/sale_product_list.dart';
import 'package:kekea_merchant/ui/sale/selected_sale_product_list.dart';

class SaleList extends StatelessWidget {
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
            if (showSelected && selectedProducts.isNotEmpty) {
              return SelectedSaleProductList(
                selectedSaleProducts: selectedProducts,
              );
            } else {
              if (saleProducts.isNotEmpty) {
                return SaleProductList(
                  saleProducts: saleProducts,
                );
              } else {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptySalePage(),
                );
              }
            }
          },
          loading: () => SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
