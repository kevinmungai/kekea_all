import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/utils/sale_product_utils/get_sale_totals.dart';
import 'package:kekea_merchant/ui/checkout/checkout_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SaleTotalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListStatusBloc, ProductListStatusState>(
      builder: (context, state) {
        final TextStyle textStyle = Theme.of(context).textTheme.headline6;
        return state.when(
          present: (
            BuiltList<SaleProduct> saleProducts,
            BuiltList<SaleProduct> selectedSaleProducts,
            bool showSelected,
          ) {
            final BigInt totals = getSaleTotals(
              saleProducts: selectedSaleProducts,
            );
            final bool isZero = totals == BigInt.zero;
            final String amount = formatAmount(amount: totals, addCents: true);
            return GestureDetector(
              child: Text(
                isZero ? "00:00" : amount,
                style: isZero
                    ? textStyle.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant,
                      )
                    : textStyle.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
              ),
              onTap: isZero
                  ? null
                  : () {
                      pushNewScreen(context, screen: CheckOutPage());
                    },
            );
          },
          loading: () => Text(
            "00.00",
            style: textStyle.copyWith(
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
        );
      },
    );
  }
}
