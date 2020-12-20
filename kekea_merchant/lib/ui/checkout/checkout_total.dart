import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/utils/sale_product_utils/get_sale_totals.dart';

class CheckOutTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListStatusBloc, ProductListStatusState>(
      builder: (context, state) {
        return state.maybeWhen(
          present: (_, BuiltList<SaleProduct> selectedProducts, __) => Text(
            formatAmount(
              amount: getSaleTotals(
                saleProducts: selectedProducts,
              ),
              addCents: true,
            ),
          ),
          orElse: () => Text("0.00"),
        );
      },
    );
  }
}
