import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/utils/colors.dart';
import 'package:kekea_core/utils/sale_product_utils/get_sale_totals.dart';

class CashTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListStatusBloc, ProductListStatusState>(
      builder: (context, state) {
        return state.maybeWhen(
          present: (_, BuiltList<SaleProduct> selectedProducts, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 32),
                    child: Text(
                      "TOTAL:",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: spanishGray,
                          ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      formatAmount(
                        amount: getSaleTotals(
                          saleProducts: selectedProducts,
                        ),
                        addCents: true,
                      ),
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: spanishGray,
                          ),
                    ),
                    Divider(
                      color: silverSand,
                      thickness: 0.7,
                    ),
                  ],
                ),
              ),
            ],
          ),
          orElse: () => Visibility(
            visible: false,
            child: Container(),
          ),
        );
      },
    );
  }
}
