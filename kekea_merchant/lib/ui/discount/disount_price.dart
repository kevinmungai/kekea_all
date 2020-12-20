import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekea_core/bloc/product_list_status_bloc/bloc.dart';
import 'package:kekea_core/data/sale_product/sale_product.dart';
import 'package:kekea_core/formatters/format_amount.dart';
import 'package:kekea_core/utils/colors.dart';
import 'package:kekea_core/utils/discount_utils.dart';

class DiscountPrice extends StatelessWidget {
  final SaleProduct saleProduct;

  const DiscountPrice({
    @required this.saleProduct,
  }) : assert(saleProduct != null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListStatusBloc, ProductListStatusState>(
      builder: (context, state) {
        return state.maybeWhen(
          present: (BuiltList<SaleProduct> saleProducts, _, __) {
            final int possibleIndex = saleProducts.indexWhere(
                (SaleProduct saleProductTwo) =>
                    saleProduct.product.id == saleProductTwo.product.id);

            if (possibleIndex != -1) {
              final SaleProduct saleProductRoot = saleProducts[possibleIndex];
              final bool changed = showDiscountSummary(
                saleProduct: saleProductRoot,
              );
              return RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                  children: [
                    TextSpan(
                      text: "price: ",
                    ),
                    if (changed) ...[
                      TextSpan(
                        text: formatAmount(
                          amount: saleProductRoot.product.price.amount,
                          addCents: true,
                        ),
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: spanishGray,
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                      TextSpan(text: "  "),
                      TextSpan(
                        text: formatAmount(
                          amount: saleProductRoot.discount.price.amount,
                          addCents: true,
                        ),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                    if (!changed)
                      TextSpan(
                        text: formatAmount(
                          amount: saleProductRoot.product.price.amount,
                          addCents: true,
                        ),
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                  ],
                ),
              );
            }
            return Visibility(
              child: Container(),
              visible: false,
            );
          },
          orElse: () => Visibility(
            child: Container(),
            visible: false,
          ),
        );
      },
    );
  }
}
